require("UnLua")
local M = Class("Blueprints.UI.BP_UIState_C")

function M:Construct()
end

function M:Init(Content)
  self:OnListItemObjectSet(Content)
end

function M:OnListItemObjectSet(Content)
  Content.SelfWidget = self
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  self.Owner = Content.Owner
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Content = Content
  self.BtnReward:UnBindEventOnClickedByObj(self)
  self.CanReceive = Content.ConfigData.CanReceive
  self.RewardsGot = Content.ConfigData.RewardsGot
  self.NotShowNum = Content.ConfigData.NotShowNum
  if self.NotShowNum then
    self.Text_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.RewardsGot then
    self.Switch_Btn:SetActiveWidgetIndex(1)
  elseif not self.CanReceive then
    self.Switch_Btn:SetActiveWidgetIndex(2)
  else
    self.Switch_Btn:SetActiveWidgetIndex(0)
  end
  self.Rewards = Content.ConfigData.Rewards
  self.ReceiveCallBack = Content.ConfigData.ReceiveCallBack
  self.BtnReward:SetText(GText(Content.ConfigData.ReceiveButtonText) or "\233\162\134\229\143\150")
  if Content.ConfigData.ReceiveCallBack then
    self.BtnReward:BindEventOnClicked(self, function()
      Content.ConfigData.ReceiveCallBack(self, Content)
    end)
  end
  self.Text_ItemName:SetText(GText(Content.ConfigData.Hint))
  self.Text_Notreach:SetText(GText(Content.ConfigData.NotreachText))
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
    self.Img_Star:SetVisibility(UIConst.VisibilityOp.Collapsed)
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

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.Owner.IsInViewMode then
      self.UsedList:SetVisibility(UIConst.VisibilityOp.Visible)
      self.SelectedIndex = 0
      local Item = self.UsedList:GetItemAt(0)
      if Item.SelfWidget then
        Item.SelfWidget:SetFocus()
        if self.Owner.NeedOpenMenuWhenResoureFocused then
          self:AddTimer(0.1, function()
            Item.SelfWidget:OnMouseButtonDown()
            Item.SelfWidget:OnMouseButtonUp()
          end, false, 0, nil, true)
        end
      end
    else
      self.UsedList:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      if not self.Owner then
        return self.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
      end
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
      self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
    end
    if not self.Owner.IsInViewMode then
      self.BtnReward:SetGamePadIconVisible(true)
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
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Left, {
          self,
          self.OnNavigateLeft
        })
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Right, {
          self,
          self.OnNavigateRight
        })
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
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Left, {
          self,
          self.OnNavigateLeft
        })
        Item.SelfWidget:SetNavigationRuleCustom(UE4.EUINavigation.Right, {
          self,
          self.OnNavigateRight
        })
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
  end, false, 0, nil, true)
end

function M:RefreshBtn(IsGot)
  if IsGot then
    self.Switch_Btn:SetActiveWidgetIndex(1)
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
  if self.UsedList then
    self.UsedList:SetVisibility(UIConst.VisibilityOp.Visible)
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
  return
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
  return
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
  self.Owner:OnNavigateDown(self.Content)
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
  self.Owner:OnNavigateUp(self.Content)
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
      if 0 == self.Switch_Btn:GetActiveWidgetIndex() then
        self.BtnReward:OnBtnClicked()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft and not self.Owner.IsInViewMode then
      IsEventHandled = true
      self.Owner.BtnReward:OnBtnClicked()
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
    self.Owner.BtnReward:SetGamePadIconVisible(true)
    self.Owner.IsInViewMode = false
    self:SetFocus()
    self.Owner:ShowGamepadViewBtn(true)
    self.Owner:ShowGamepadViewSingleBtn(false)
    self.Owner:ChangeCloseShortKeyText(GText("UI_Controller_Close"))
  else
    self.Owner:ChangeCloseShortKeyText(GText("UI_Tips_Close"))
    self.Owner.BtnReward:SetGamePadIconVisible(false)
    self.UsedList:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Owner.IsInViewMode = true
    self.SelectedIndex = 0
    local Item = self.UsedList:GetItemAt(0)
    if Item.SelfWidget then
      Item.SelfWidget:SetFocus()
    end
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
  self:PlayAnimation(self.Hover)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  self.IsEnter = false
  if self.Mobile or self:IsAnimationPlaying(self.In) then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnFocusLost(InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.BtnReward:SetGamePadIconVisible(false)
  end
end

return M
