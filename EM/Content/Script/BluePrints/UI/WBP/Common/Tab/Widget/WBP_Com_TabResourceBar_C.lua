require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Add.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Item.OnHovered:Add(self, self.OnIconHovered)
  self.Btn_Item.OnUnhovered:Add(self, self.OnIconUnhovered)
  self.Btn_Item.OnPressed:Add(self, self.OnIconPressed)
  self.Btn_Item.OnClicked:Add(self, self.OnIconClicked)
  self.Common_Item_Icon:BindEvents(self, {
    OnMenuOpenChanged = self.OnMenuOpenChanged
  })
  self:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnUINavigation
  })
  self:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnUINavigation
  })
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  EventManager:AddEvent(EventID.OnResourcesChanged, self, self.OnResourcesChanged)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self:GetOwningPlayer())
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnResourcesChanged, self)
end

function M:OnResourcesChanged(ResourceId)
  if self.RId and self.RId == ResourceId then
    self:RefreshResourceInfo()
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamePad = CurInputDevice == ECommonInputType.Gamepad
end

function M:SetResourceId(ResourceId)
  self.Panel_Resource:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.RId = ResourceId
  self:RefreshResourceInfo()
end

function M:SetAddVisibilty(bIsVisible)
  if bIsVisible then
    self.Btn_Add:SetVisibility(UIConst.VisibilityOp.Visible)
    self.SizeBox_Add:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.SizeBox_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:ShowBubble(ConfigData)
  self.HudBubbleWidget = UIManager(self):_CreateWidgetNew("CommonHudBubble")
  self.Pos_Bubble:AddChild(self.HudBubbleWidget)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.HudBubbleWidget)
  OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Center)
  OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Center)
  self.HudBubbleWidget:Init({
    IconPath = ConfigData.IconPath,
    Text = ConfigData.Text,
    TextColor = ConfigData.TextColor
  })
  self.HudBubbleWidget:PlayAnimation(self.HudBubbleWidget.In)
end

function M:HideBubble()
  if IsValid(self.HudBubbleWidget) then
    self.HudBubbleWidget:StopAnimation(self.HudBubbleWidget.In)
    self.HudBubbleWidget:PlayAnimation(self.HudBubbleWidget.Out)
  end
  self.HudBubbleWidget = nil
end

function M:RefreshResourceInfo()
  if self.RId then
    local Avatar = GWorld:GetAvatar()
    local FormData = DataMgr.CurrencyForm[self.RId]
    if FormData and FormData.IfAdd then
      self.Btn_Add:SetVisibility(UIConst.VisibilityOp.Visible)
      self.SizeBox_Add:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Btn_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.SizeBox_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    local Data = DataMgr.Resource[self.RId]
    if Avatar and Data then
      local Resource
      if self.RId == CommonConst.ActionPoint then
        Resource = {
          Count = Avatar.ActionPoint or 0
        }
        if FormData and FormData.IfMax then
          self.WidgetSwitcher_Num:SetActiveWidgetIndex(1)
          self.Num_AP_Now:SetText(Resource.Count)
          self.Num_AP_Total:SetText(DataMgr.GlobalConstant.CostRecoveryMax.ConstantValue)
        else
          self.WidgetSwitcher_Num:SetActiveWidgetIndex(0)
          self.Text_Num:SetText(Resource.Count)
        end
      else
        Resource = Avatar.Resources[self.RId] or {Count = 0}
        self.Text_Num:SetText(Resource.Count)
      end
      self.Panel_Resource:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      return
    end
  end
  self.Panel_Resource:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:BindEventOnClicked()
end

function M:BindEventOnClicked(obj, event)
  self.Obj_OnClick = obj
  self.Event_OnClick = event
end

function M:OnBtnClicked()
  if self.Event_OnClick then
    self.Event_OnClick(self.Obj_OnClick)
  end
  if self.RId == CommonConst.PhysicalStrengthId then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
    local GameInstance = self:GetGameInstance()
    local UIManager = GameInstance:GetGameUIManager()
  elseif self.RId == CommonConst.Coins.Coin1 then
    local GameInstance = self:GetGameInstance()
    local UIManager = GameInstance:GetGameUIManager()
    local MaxValue = 0
    local Data = DataMgr.Resource[CommonConst.Coins.Coin4]
    local Avatar = GWorld:GetAvatar()
    if Avatar and Data then
      local Resource = Avatar.Resources[CommonConst.Coins.Coin4] or {Count = 0}
      MaxValue = Resource.Count
    end
    local CommonDialogWidget = UIManager:GetUIObj("CommonDialog")
    if CommonDialogWidget then
      if CommonDialogWidget:GetContentWidgetByName("Shop_ExchangePart") then
        return
      end
      UIManager:ShowCommonPopupUI_Interrupt(100198, {
        AutoFocus = true,
        Funds = {
          {
            FundId = CommonConst.Coins.Coin4,
            FundNeed = MaxValue
          }
        }
      })
    else
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
      UIManager:ShowCommonPopupUI(100198, {
        AutoFocus = true,
        Funds = {
          {
            FundId = CommonConst.Coins.Coin4,
            FundNeed = MaxValue
          }
        }
      })
    end
  end
end

function M:PlayInAnim()
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  return self.In:GetEndTime()
end

function M:PlayOutAnim()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  return self.Out:GetEndTime()
end

function M:OnIconHovered()
  return self.Common_Item_Icon:OnMouseEnter()
end

function M:OnIconUnhovered()
  return self.Common_Item_Icon:OnMouseLeave()
end

function M:OnIconPressed()
  return self.Common_Item_Icon:OnMouseButtonDown()
end

function M:OnIconClicked()
  return self.Common_Item_Icon:OnMouseButtonUp()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Item)
end

function M:BindEventOnMenuOpenChanged(obj, event)
  self.Obj_OnMenuOpenChanged = obj
  self.Event_OnMenuOpenChanged = event
end

function M:OnMenuOpenChanged(bIsOpen)
  self.bIsMenuOpened = bIsOpen
  if not bIsOpen and self.IsGamePad then
    self:SetFocus()
  end
  if self.Event_OnMenuOpenChanged then
    self.Event_OnMenuOpenChanged(self.Obj_OnMenuOpenChanged, bIsOpen)
  end
end

function M:IsMenuOpened()
  return self.bIsMenuOpened
end

function M:BindNavigationEvents(Obj, Events)
  Events = Events or {}
  self.Obj_Navigation = Obj
  self.Event_OnNavigationToBoundary = Events.OnNavigationToBoundary
  self.Event_OnAddedToFocusPath = Events.OnAddedToFocusPath
  self.Event_OnRemovedFromFocusPath = Events.OnRemovedFromFocusPath
end

function M:OnNavigationToBoundary(NavigationDirection)
  if self.Event_OnNavigationToBoundary then
    return self.Event_OnNavigationToBoundary(self.Obj_Navigation, NavigationDirection)
  end
  return nil
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.Event_OnAddedToFocusPath then
    self.Event_OnAddedToFocusPath(self.Obj_Navigation, self)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.Event_OnRemovedFromFocusPath then
    self.Event_OnRemovedFromFocusPath(self.Obj_Navigation, self)
  end
end

function M:OnUINavigation(NavigationDirection)
  if self.Btn_Add:HasAnyUserFocus() then
    if NavigationDirection == EUINavigation.Left then
      return self.Btn_Item
    else
      return self:OnNavigationToBoundary(NavigationDirection)
    end
  elseif NavigationDirection == EUINavigation.Left then
    return self:OnNavigationToBoundary(NavigationDirection)
  elseif self.Btn_Add:IsVisible() and not self:IsMenuOpened() then
    return self.Btn_Add
  else
    return self:OnNavigationToBoundary(NavigationDirection)
  end
end

return M
