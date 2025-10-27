require("UnLua")
local M = Class("Blueprints.UI.BP_UIState_C")

function M:Construct()
end

function M:Init(Content)
  self:OnListItemObjectSet(Content)
end

function M:OnListItemObjectSet(Content)
  Content.SelfWidget = self
  self.Type = Content.ConfigData.Type
  self.ItemId = Content.ConfigData.ItemId
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  self.Owner = Content.Owner
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Content = Content
  self.Btn_Reward:UnBindEventOnClickedByObj(self)
  self.CanReceive = Content.ConfigData.CanReceive
  self.RewardsGot = Content.ConfigData.RewardsGot
  self.NotShowNum = Content.ConfigData.NotShowNum
  self.ReddotName = Content.ConfigData.ReddotName
  self.TextProgress = Content.ConfigData.TextProgress
  if self.TextProgress then
    self.Text_Progress:SetText(self.TextProgress)
    self.Text_Progress:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.HasGoto = Content.ConfigData.HasGoto
  if self.NotShowNum then
    self.Text_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.RewardsGot then
    self.WS_State:SetActiveWidgetIndex(1)
  elseif not self.CanReceive then
    self.WS_State:SetActiveWidgetIndex(2)
  elseif self.HasGoto then
    self.WS_State:SetActiveWidgetIndex(3)
  else
    self.WS_State:SetActiveWidgetIndex(0)
  end
  self.Rewards = Content.ConfigData.Rewards
  self.ReceiveCallBack = Content.ConfigData.ReceiveCallBack
  self.Btn_Reward:SetText(GText(Content.ConfigData.ReceiveButtonText) or "\233\162\134\229\143\150")
  if Content.ConfigData.ReceiveCallBack then
    self.Btn_Reward:BindEventOnClicked(self, function()
      Content.ConfigData.ReceiveCallBack(self, Content)
    end)
  end
  self.Text_Content:SetText(GText(Content.ConfigData.Hint))
  if self.WidgetSwitcher_State then
    if Content.ConfigData.BreakStarCount then
      self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
      self:InitBreakStartCount(Content.ConfigData.BreakStarCount)
    else
      self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    end
  end
  self.Text_Ing:SetText(GText(Content.ConfigData.NotreachText))
  if Content.ConfigData.LeftAligned then
    self.List_Item_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.List_Item_L:SetVisibility(UIConst.VisibilityOp.Visible)
    self.UsedList = self.List_Item_L
  else
    self.List_Item_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.List_Item_R:SetVisibility(UIConst.VisibilityOp.Visible)
    self.UsedList = self.List_Item_R
  end
  if not Content.ConfigData.ShowIcon then
    self.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self:SetIcon(Content.ConfigData.IconPath)
  end
  self.Text_Num:SetText(Content.ConfigData.SourceNum)
  self.SourceNum = Content.ConfigData.SourceNum
  self.UsedList:ClearListItems()
  if not self.IsListened then
    self:AddInputMethodChangedListen()
  end
  self.IsListened = true
  self:InitRewards(Content.ConfigData)
end

function M:SetIcon(IconPath)
  if IconPath then
    local Icon = LoadObject(IconPath)
    self.Icon:SetBrushResourceObject(Icon)
  end
end

function M:FocusToRewardItem()
  self.UsedList:SetVisibility(UIConst.VisibilityOp.Visible)
  local ItemUIs = self.UsedList:GetDisplayedEntryWidgets()
  self.SelectedIndex = 0
  if ItemUIs:Length() > 0 then
    local TargetWidget
    for i = 1, ItemUIs:Length() do
      local Widget = ItemUIs:GetRef(i)
      if Widget then
        self.UsedList:SetSelectedIndex(i - 1)
        self.UsedList:NavigateToIndex(i - 1)
        if self.Owner.NeedOpenMenuWhenResoureFocused then
          self:AddTimer(0.1, function()
            Widget:OnMouseButtonDown()
            Widget:OnMouseButtonUp()
          end, false, 0, nil, true)
        end
        return Widget
      end
    end
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.Owner.IsInViewMode then
      self:AddTimer(0.001, function()
        self:FocusToRewardItem()
      end, false, 0, nil, true)
    else
      self.UsedList:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      if not self.Owner then
        return self.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
      end
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
      self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
    end
    if not self.Owner.IsInViewMode then
      self.Owner:ShowGamepadViewBtn(true)
      self.Btn_Reward:SetGamePadIconVisible(true)
    end
  end
  return self.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:InitRewards(Config)
  if not Config.Rewards then
    return
  end
  for _, Reward in pairs(Config.Rewards) do
    local Item = self:NewItemContent(Reward.ItemType, Reward.ItemId, Reward.Count)
    if Config.LeftAligned then
      self.List_Item_L:AddItem(Item)
    else
      self.List_Item_R:AddItem(Item)
    end
  end
  self:AddTimer(0.01, function()
    local AllItemCount = self.List_Item_L:GetNumItems()
    for i = 0, AllItemCount - 1 do
      local Item = self.List_Item_L:GetItemAt(i)
      if Item.SelfWidget then
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
          self,
          self.OnNavigateUp
        })
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
          self,
          self.OnNavigateDown
        })
      end
    end
    AllItemCount = self.List_Item_R:GetNumItems()
    for i = 0, AllItemCount - 1 do
      local Item = self.List_Item_R:GetItemAt(i)
      if Item.SelfWidget then
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
          self,
          self.OnNavigateUp
        })
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
          self,
          self.OnNavigateDown
        })
      end
    end
    self.UsedList:SetScrollOffset(0)
  end, false, 0, nil, true)
end

function M:RefreshBtn(IsGot)
  if IsGot then
    self.WS_State:SetActiveWidgetIndex(1)
  end
end

function M:RefreshReddotInfo()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotName)
  if CacheDetail[self.Type] and CacheDetail[self.Type][self.ItemId] then
    CacheDetail[self.Type][self.ItemId] = nil
    if nil == next(CacheDetail[self.Type]) then
      CacheDetail[self.Type] = nil
    end
    ReddotManager.DecreaseLeafNodeCount(self.ReddotName)
  end
end

function M:RefreshBaseInfo()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:InitKeyBoardView()
  else
    self:InitGamepadView()
  end
end

function M:AddInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:InitGamepadView()
  self.UsedList:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Owner:ChangeCloseShortKeyText(GText("UI_Controller_Close"))
end

function M:InitKeyBoardView()
  if self.Owner.IsInViewMode then
    self.Owner:UpdateUIStyle(true)
    self:SwitchSelectedMode()
  end
  if self.UsedList then
    self.UsedList:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.BG:PlayAnimation(self.BG.Normal)
end

function M:InitBreakStartCount(BreakStarCount)
  for i = 0, 5 do
    local Star = 0 == i and self.Star or self["Star_" .. i]
    if Star then
      Star.Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if i < BreakStarCount then
        Star.Switcher_Star:SetActiveWidgetIndex(0)
      end
    end
  end
end

function M:Destruct()
  self:RemoveInputMethodChangedListen()
  self.Super.Destruct(self)
end

function M:NewItemContent(ItemType, ItemId, Count)
  if 0 == ItemId then
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    return Obj
  end
  local ItemData = DataMgr[ItemType][ItemId]
  if not ItemData then
    print(_G.LogTag, "Error: Item Data is nil, ItemType:", ItemType, "ItemId", ItemId)
    return nil
  end
  local NewObj = NewObject(UIUtils.GetCommonItemContentClass())
  NewObj.ItemType = ItemType:gsub("^%l", string.upper)
  NewObj.Id = ItemId
  NewObj.Rarity = ItemData.Rarity or ItemData.WeaponRarity or 1
  NewObj.Icon = ItemData.Icon
  NewObj.Count = Count
  NewObj.IsShowDetails = true
  NewObj.ParentWidget = self
  NewObj.OnMenuOpenChangedEvents = {
    Obj = self,
    Callback = self.OnMenuOpenChanged
  }
  return NewObj
end

function M:OnMenuOpenChanged(bIsOpen, Obj)
  if Obj.SelfWidget and false == bIsOpen and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    Obj.SelfWidget.Item:PlayAnimation(Obj.SelfWidget.Item.Hover)
  end
  self.Owner:OnMenuOpenChanged(bIsOpen)
end

function M:OnNavigateLeft()
  if self.SelectedIndex - 1 >= 0 then
    return self:UpdateSelectedWidget(self.SelectedIndex - 1)
  end
  local CurItem = self.UsedList:GetItemAt(self.SelectedIndex)
  return CurItem.SelfWidget
end

function M:UpdateSelectedWidget(SelectedIndex)
  self.Owner.NeedOpenMenuWhenResoureFocused = false
  local CurItem = self.UsedList:GetItemAt(self.SelectedIndex)
  if CurItem and CurItem.SelfWidget then
    local CurWdiget = CurItem.SelfWidget
    self.Owner.NeedOpenMenuWhenResoureFocused = CurWdiget.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen()
    if self.Owner.NeedOpenMenuWhenResoureFocused then
    end
  end
  self.SelectedIndex = SelectedIndex
  self.UsedList:NavigateToIndex(self.SelectedIndex)
  local NewFocusItem = self.UsedList:GetItemAt(self.SelectedIndex)
  self.UsedList:SetSelectedIndex(self.SelectedIndex)
  if NewFocusItem and NewFocusItem.SelfWidget then
    if self.Owner.NeedOpenMenuWhenResoureFocused then
      self:AddTimer(0.01, function()
        NewFocusItem.SelfWidget:OnMouseButtonDown()
        NewFocusItem.SelfWidget:OnMouseButtonUp()
      end, false, 0, nil, true)
    end
    return NewFocusItem.SelfWidget
  end
  return
end

function M:OnNavigateRight()
  local ItemsCount = self.UsedList:GetNumItems()
  if ItemsCount > self.SelectedIndex + 1 then
    return self:UpdateSelectedWidget(self.SelectedIndex + 1)
  end
  local CurItem = self.UsedList:GetItemAt(self.SelectedIndex)
  return CurItem.SelfWidget
end

function M:OnNavigateDown()
  local CurItem = self.UsedList:GetItemAt(self.SelectedIndex)
  if CurItem and CurItem.SelfWidget then
    local CurWdiget = CurItem.SelfWidget
    self.Owner.NeedOpenMenuWhenResoureFocused = CurWdiget.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen()
    if self.Owner.NeedOpenMenuWhenResoureFocused then
      CurWdiget:OnMouseButtonDown()
      CurWdiget:OnMouseButtonUp()
    end
  end
  return self.Owner:OnNavigateDown(self.Content)
end

function M:OnNavigateUp()
  local CurItem = self.UsedList:GetItemAt(self.SelectedIndex)
  if CurItem and CurItem.SelfWidget then
    local CurWdiget = CurItem.SelfWidget
    self.Owner.NeedOpenMenuWhenResoureFocused = CurWdiget.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen()
    if self.Owner.NeedOpenMenuWhenResoureFocused then
      CurWdiget:OnMouseButtonDown()
      CurWdiget:OnMouseButtonUp()
    end
  end
  return self.Owner:OnNavigateUp(self.Content)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.LeftThumb then
      IsEventHandled = true
      self:SwitchSelectedMode()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      if self.Owner.IsInViewMode then
        IsEventHandled = true
        self:SwitchSelectedMode()
        self:SetFocus()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      IsEventHandled = true
      if 0 == self.WS_State:GetActiveWidgetIndex() then
        self.Btn_Reward:OnBtnClicked()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop and not self.Owner.IsInViewMode then
      IsEventHandled = true
      self.Owner.Btn_GetAll:OnBtnClicked()
    end
  elseif "SpaceBar" == InKeyName then
    IsEventHandled = true
    self.Owner.Btn_GetAll:OnBtnClicked()
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.FaceButtonBottom and not self.Owner.IsInViewMode then
    IsEventHandled = true
    if 0 == self.WS_State:GetActiveWidgetIndex() then
      self.Btn_Reward:OnBtnClicked()
    end
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:SwitchSelectedMode()
  if self.Owner.IsInViewMode then
    self.Owner.Btn_GetAll:SetGamePadIconVisible(true)
    self.Owner.IsInViewMode = false
    self:SetFocus()
    self.Owner:ShowGamepadViewBtn(true)
    self.Owner:ShowGamepadViewSingleBtn(false)
    self.Owner:ChangeCloseShortKeyText(GText("UI_Controller_Close"))
  else
    self.Owner:ChangeCloseShortKeyText(GText("UI_Tips_Close"))
    self.Owner.Btn_GetAll:SetGamePadIconVisible(false)
    self.UsedList:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Owner.IsInViewMode = true
    self.SelectedIndex = 0
    self:FocusToRewardItem()
    self.Owner:ShowGamepadViewBtn(false)
    self.Owner:ShowGamepadViewSingleBtn(true)
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  self.IsEnter = true
  local IsGamePad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  if self.Mobile or self:IsAnimationPlaying(self.In) or not IsGamePad then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  self:StopAllAnimations()
  self.BG:OnCellHovered()
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  self.IsEnter = false
  local IsGamePad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  if self.Mobile or self:IsAnimationPlaying(self.In) or not IsGamePad then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  self:StopAllAnimations()
  self.BG:OnCellUnhovered()
end

function M:OnFocusLost(InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Btn_Reward:SetGamePadIconVisible(false)
  end
end

return M
