require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  local LastWidget
  if Params.LeftItems and #Params.LeftItems > 0 then
    local LeftItems = Params.LeftItems
    for i = 1, #LeftItems do
      local LeftItem = LeftItems[i]
      local Content = self:NewItemContent(LeftItem.ItemType, LeftItem.ItemId, LeftItem.Count)
      local ItemWidget = self:CreateWidgetNew("ComItemUniversalM")
      self.HighLevel:AddChild(ItemWidget)
      ItemWidget.bIsFocusable = true
      ItemWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      ItemWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
      ItemWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      ItemWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      local Events = {}
      Events.OnMenuOpenChanged = self.OnMenuOpenChanged
      ItemWidget:BindEvents(self, Events)
      ItemWidget:Init(Content)
      if LastWidget then
        LastWidget:SetNavigationRuleExplicit(EUINavigation.Right, ItemWidget)
        ItemWidget:SetNavigationRuleExplicit(EUINavigation.Left, LastWidget)
      end
      LastWidget = ItemWidget
    end
  end
  if Params.RightItems and #Params.RightItems > 0 then
    local RightItems = Params.RightItems
    for i = 1, #RightItems do
      local RightItem = RightItems[i]
      local Content = self:NewItemContent(RightItem.ItemType, RightItem.ItemId, RightItem.Count, RightItem.NeedCount)
      local ItemWidget = self:CreateWidgetNew("ComItemUniversalM")
      self.LowLevel:AddChild(ItemWidget)
      ItemWidget.bIsFocusable = true
      local Events = {}
      Events.OnMenuOpenChanged = self.OnMenuOpenChanged
      ItemWidget:BindEvents(self, Events)
      ItemWidget:Init(Content)
      ItemWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      ItemWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
      ItemWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      ItemWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      if LastWidget then
        LastWidget:SetNavigationRuleExplicit(EUINavigation.Right, ItemWidget)
        ItemWidget:SetNavigationRuleExplicit(EUINavigation.Left, LastWidget)
      end
      LastWidget = ItemWidget
    end
  end
  self.OpenTipsButtonIndex = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.ButtonIndexB = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  self.ButtonIndexA = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Tips_Ensure")
  })
  self:HideGamepadShortcut(self.ButtonIndexA)
  self:HideGamepadShortcut(self.ButtonIndexB)
end

function M:InitGamepadView()
  self:RefreshBottomKey()
  if self.bItemMenuOpen or self:HasFocusDetail() then
    return
  end
end

function M:NewItemContent(ItemType, ItemId, Count, NeedCount)
  if 0 == ItemId then
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Id = 0
    return Obj
  end
  local ItemData = DataMgr[ItemType][ItemId]
  if not ItemData then
    print(_G.LogTag, "Error: Item Data is nil, ItemType:", ItemType, "ItemId", ItemId)
    return nil
  end
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.ItemType = ItemType:gsub("^%l", string.upper)
  Obj.Id = ItemId
  Obj.Rarity = ItemData.Rarity or ItemData.WeaponRarity or 1
  Obj.Icon = ItemData.Icon
  Obj.Count = Count
  Obj.NeedCount = NeedCount
  Obj.IsShowDetails = true
  Obj.UIName = "Exchange"
  return Obj
end

function M:GetFocusTarget()
  return self.HighLevel:GetChildAt(0) or self.LowLevel:GetChildAt(0) or self.HighLevel
end

function M:HasFocusDetail()
  if self.HighLevel:HasFocusedDescendants() or self.HighLevel:HasAnyUserFocus() or self.LowLevel:HasFocusedDescendants() or self.LowLevel:HasAnyUserFocus() then
    return true
  end
  return false
end

function M:RefreshBottomKey()
  if self.bItemMenuOpen then
    self:HideGamepadShortcut(self.ButtonIndexA)
    self:HideGamepadShortcut(self.ButtonIndexB)
    self:HideGamepadShortcut(self.OpenTipsButtonIndex)
    self:SetGamepadBtnKeyVisibility(false)
  elseif self:HasFocusDetail() then
    self:ShowGamepadShortcut(self.ButtonIndexA)
    self:ShowGamepadShortcut(self.ButtonIndexB)
    self:HideGamepadShortcut(self.OpenTipsButtonIndex)
    self:SetGamepadBtnKeyVisibility(false)
  else
    self:HideGamepadShortcut(self.ButtonIndexA)
    self:HideGamepadShortcut(self.ButtonIndexB)
    self:ShowGamepadShortcut(self.OpenTipsButtonIndex)
    self:SetGamepadBtnKeyVisibility(true)
  end
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  self.Arrow.bIsFocusable = true
  if InKeyName == Const.GamepadLeftThumbstick then
    self:GetFocusTarget():SetFocus()
    self:RefreshBottomKey()
    return true
  end
  if InKeyName == Const.GamepadFaceButtonRight and self:HasFocusDetail() then
    self.Owner:SetFocus()
    self:RefreshBottomKey()
    return true
  end
  return false
end

function M:BP_GetDesiredFocusTarget()
  return self
end

function M:OnMenuOpenChanged(IsOpen)
  self.bItemMenuOpen = IsOpen
  self:RefreshBottomKey()
end

return M
