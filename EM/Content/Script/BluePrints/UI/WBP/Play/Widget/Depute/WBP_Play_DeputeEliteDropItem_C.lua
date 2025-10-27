require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local TypeSort = {
  Char = 1,
  Weapon = 2,
  Mod = 3,
  Draft = 4,
  Reward = 5,
  Resource = 6
}

function M:OnListItemObjectSet(Content)
  if 0 == Content.MonId then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.bIsFocusable = false
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
    return
  end
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.bIsFocusable = true
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:AddInputMethodChangedListen()
  self.List_EliteProp:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_EliteProp:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_EliteProp:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_EliteProp:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.MonId = Content.MonId
  self.Parent = Content.Parent
  self.ParentWidget = Content.ParentWidget
  self.Monster_Elite:SetVisibility(ESlateVisibility.HitTestInvisible)
  local MonsterData = DataMgr.Monster[self.MonId]
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  local Obj = {}
  Obj.WeaknessIcon = self.Parent:GetMonsterWeaknessIcon(self.MonId)
  self.Monster_Elite:SetBasicData(self.MonId, Obj)
  self.Text_Elite:SetText(GText(MonsterData.UnitName))
  self.Text_Get:SetText(GText("UI_Dungeon_MonsterReward"))
  local MonRewardData
  for _, Data in pairs(DataMgr.ModDungeonMonReward) do
    if Data.MonsterUnitId == self.MonId then
      MonRewardData = Data
      break
    end
  end
  if not MonRewardData then
    return
  end
  self:RefreshRewardInfoList(MonRewardData.DungeonRewardView)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse and self.IsEnter then
    self:PlayAnimation(self.Unhover)
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:RefreshRewardInfoList(DungeonReward)
  if not DungeonReward then
    DebugPrint("SL DungeonReward is nil")
    return
  end
  local RewardList = RewardUtils:GetRewardViewInfoById(DungeonReward)
  self.RewardList = RewardList
  for _, ItemData in pairs(RewardList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = ItemData.Id
    Content.Icon = ItemUtils.GetItemIconPath(ItemData.Id, ItemData.Type)
    Content.ParentWidget = self
    Content.ItemType = ItemData.Type
    Content.Rarity = ItemData.Rarity or 1
    Content.IsShowDetails = true
    Content.UIName = "StyleOfPlay"
    if ItemData.DropType then
      Content.bRare = DataMgr.DropProbType[ItemData.DropType].IsRareItem
    end
    if ItemData.Quantity then
      if #ItemData.Quantity > 1 then
        Content.Count = ItemData.Quantity[1]
        Content.MaxCount = ItemData.Quantity[2]
      else
        Content.Count = ItemData.Quantity[1]
      end
    end
    Content.bShadow = false
    if Content.ItemType == "Mod" then
      local ModModel = ModController:GetModel()
      Content.bShadow = ModModel:GetModCountById(Content.Id) <= 0
    elseif Content.ItemType == "Walnut" then
      local WalnutsInBag = Avatar.Walnuts.WalnutBag
      Content.bShadow = (WalnutsInBag[Content.Id] or 0) <= 0
    end
    self.List_EliteProp:AddItem(Content)
  end
  self:AddTimer(0.01, function()
    local RewardItemUIs = self.List_EliteProp:GetDisplayedEntryWidgets()
    local RestCount = UIUtils.GetListViewContentMaxCount(self.List_EliteProp, RewardItemUIs, true) - RewardItemUIs:Length()
    for i = 1, RestCount do
      self:CreateAndAddEmptyItem()
    end
  end, false, 0, "DeputeDetailListView_List_EliteProp")
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  self.IsEnter = true
  if self.Mobile or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  self.IsEnter = false
  if self.Mobile or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Unhover)
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self:ShowGamepadABtn(false)
    self.ParentWidget:ShowGamepadCloseBtn(false)
    self.ParentWidget:ShowGamepadLSBtn(false)
  else
    self:ShowGamepadABtn(true)
    self.ParentWidget:ShowGamepadCloseBtn(true)
    self.ParentWidget:ShowGamepadLSBtn(false)
  end
end

function M:CreateAndAddEmptyItem()
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.Id = 0
  self.List_EliteProp:AddItem(Content)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  DebugPrint("SL OnGamePadDown is DeputeEliteDropItem InKeyName", InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadLeftThumbstick then
    local RewardItemUIs = self.List_EliteProp:GetDisplayedEntryWidgets()
    if not RewardItemUIs[1]:HasAnyUserFocus() then
      self.List_EliteProp:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.List_EliteProp:NavigateToIndex(0)
      self:ShowGamepadABtn(true)
      self.ParentWidget:ShowGamepadCloseBtn(true)
      self.ParentWidget:ShowGamepadLSBtn(false)
      local len = self.List_EliteProp:GetNumItems()
      for i = 1, len do
        local entryWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_EliteProp, i - 1)
        if entryWidget then
          entryWidget:BindEvents(self, {
            OnMenuOpenChanged = self.OnStuffMenuOpenChanged
          })
        end
      end
    else
      self:SetFocus()
      self:ShowGamepadABtn(false)
      self.ParentWidget:ShowGamepadLSBtn(true)
      self.ParentWidget:ShowGamepadCloseBtn(true)
      self.List_EliteProp:SetVisibility(ESlateVisibility.HitTestInvisible)
    end
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonRight then
    local RewardItemUIs = self.List_EliteProp:GetDisplayedEntryWidgets()
    for i = 1, RewardItemUIs:Length() do
      if RewardItemUIs[i]:HasAnyUserFocus() then
        self:SetFocus()
        self:ShowGamepadABtn(false)
        self.ParentWidget:ShowGamepadCloseBtn(true)
        self.ParentWidget:ShowGamepadLSBtn(true)
        self.List_EliteProp:SetVisibility(ESlateVisibility.HitTestInvisible)
        IsEventHandled = true
        break
      end
    end
  end
  return IsEventHandled
end

function M:ShowGamepadABtn(bIsShow)
  if bIsShow then
    self.GamepadCheckItemKeyInfo = self.GamepadCheckItemKeyInfo or self.ParentWidget:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
        }
      },
      Desc = GText("UI_Controller_CheckDetails")
    })
  elseif self.GamepadCheckItemKeyInfo then
    self.ParentWidget:HideGamepadShortcut(self.GamepadCheckItemKeyInfo)
    self.GamepadCheckItemKeyInfo = nil
  end
end

return M
