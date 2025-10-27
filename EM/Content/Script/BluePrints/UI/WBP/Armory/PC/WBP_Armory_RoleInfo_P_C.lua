require("UnLua")
local M = Class("BluePrints.UI.WBP.Armory.WBP_Armory_RoleInfo_Base_C")
M._components = {
  "BluePrints.UI.KeyInputComponent"
}

function M:Construct()
  M.Super.Construct(self)
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    }
  })
  self.RewardBtn = self.LevelInfo.Btn_ExpReward.Btn_Area
  self.Button_More.bIsFocusable = true
  self.Btn_Info.bIsFocusable = true
  self:AddInputMethodChangedListen()
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  M.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
  if self.IsInFocusPath then
    if self.RewardBtn:IsVisible() then
      if not UIUtils.HasAnyFocus(self.RewardBtn) and not UIUtils.HasAnyFocus(self.Button_More) and not UIUtils.HasAnyFocus(self.Btn_Info) then
        self.RewardBtn:SetFocus()
      end
    elseif not UIUtils.HasAnyFocus(self.Button_More) and not UIUtils.HasAnyFocus(self.Btn_Info) then
      self.Button_More:SetFocus()
    end
  end
  self:ClearAllKeyEvents()
  self:AddKeyDownEvent(UIConst.GamePadKey.RightThumb, self.OnGamepadRightThumbstick)
  self:AddKeyDownEvent(UIConst.GamePadKey.FaceButtonTop, self.OnFaceButtonTopKeyDown)
  self:AddKeyDownEvent(UIConst.GamePadKey.FaceButtonLeft, self.OnFaceButtonLeftKeyDown)
  self:AddKeyUpEvent(UIConst.GamePadKey.FaceButtonTop, self.OnFaceButtonTopKeyUp)
  self:AddLongPressEvent(UIConst.GamePadKey.FaceButtonTop, 1, self.OnGamepad_FaceButton_Top_LongPressStart, self.OnGamepad_FaceButton_Top_LongPressCancel, self.OnGamepad_FaceButton_Top_LongPressEnd)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputDevice, CurGamepadName)
  if self.IsGamepadInput then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
  end
end

function M:InitNavigationRules()
  local TopWidget
  if self.LevelInfo:GetBtnExpRewardVisible() then
    TopWidget = self.RewardBtn
  elseif self.Describe:IsVisible() then
    TopWidget = self.Button_More
  else
    TopWidget = self.PosItem
  end
  TopWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  TopWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
  TopWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  local NextWidget = TopWidget
  if self.LevelInfo:GetBtnExpRewardVisible() then
    NextWidget = self.Describe:IsVisible() and self.Button_More or self.PosItem
    TopWidget:SetNavigationRuleExplicit(EUINavigation.Down, NextWidget)
    NextWidget:SetNavigationRuleExplicit(EUINavigation.Up, TopWidget)
    NextWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
    NextWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
  local NextWidgetDownRule = self.Btn_Info:IsVisible() and self.Btn_Info or EUINavigationRule.Stop
  NextWidget:SetNavigationRuleExplicit(EUINavigation.Down, NextWidgetDownRule)
  if NextWidget:IsVisible() then
    self.Btn_Info:SetNavigationRuleExplicit(EUINavigation.Up, NextWidget)
  else
    self.Btn_Info:SetNavigationRuleExplicit(EUINavigation.Up, TopWidget)
  end
  self.Btn_Info:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
  self.Btn_Info:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.Btn_Info:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.LevelInfo:GetBtnExpRewardVisible() then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.RewardBtn)
  elseif self.Describe:IsVisible() then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Button_More)
  elseif self.PosItem:IsVisible() then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.PosItem)
  else
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Info)
  end
end

function M:UpdateTargetInfo(...)
  M.Super.UpdateTargetInfo(self, ...)
  if self.Describe:IsVisible() or self.Btn_Info:IsVisible() then
    self.bIsFocusable = true
  else
    self.bIsFocusable = false
  end
end

function M:Init(Params)
  M.Super.Init(self, Params)
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self:InitNavigationRules()
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local Reply, IsHandled = self:ProcessOnKeyDown(MyGeometry, InKeyEvent)
  if IsHandled then
    return Reply
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled(), false
end

function M:OnParentKeyUp(MyGeometry, InKeyEvent)
  local Reply, IsHandled = self:ProcessOnKeyUp(MyGeometry, InKeyEvent)
  if IsHandled then
    return Reply
  end
  return UIUtils.Unhandled, false
end

function M:OnFaceButtonTopKeyDown()
  if self.IsPreviewMode then
    return
  end
  if 0 == self.WidgetSwitcher_State:GetActiveWidgetIndex() and self.ConfirmBtns[2]:IsVisible() and not self.ConfirmBtns[2].IsForbidden then
    self:OnReplaceBtnClicked()
    return UE4.UWidgetBlueprintLibrary.Handled(), true
  end
end

function M:OnFaceButtonLeftKeyDown()
  if not self.Btn_MaxSwitch:IsVisible() then
    return
  end
  self.Btn_MaxSwitch:OnClicked()
end

function M:OnFaceButtonTopKeyUp()
  if 1 == self.WidgetSwitcher_State:GetActiveWidgetIndex() and self.Btn_Unlock:IsVisible() then
    self:OnUnlockBtnClicked()
  end
end

function M:OnGamepadRightThumbstick()
  if self.IsShowModButton then
    self:OnModBtnClicked()
    return UE4.UWidgetBlueprintLibrary.Handled(), true
  end
  if self.Btn_Info:IsVisible() then
    self:OnBtnDetailsClick()
    return UE4.UWidgetBlueprintLibrary.Handled(), true
  end
end

function M:OnGamepad_FaceButton_Top_LongPressStart()
  self.Btn_Unlock.Key_Consume:OnButtonPressed(false, true, 0, self:GetLongPressAnimationTime(UIConst.GamePadKey.FaceButtonTop))
end

function M:OnGamepad_FaceButton_Top_LongPressEnd()
  self.Btn_Unlock:SetFocus()
end

function M:OnGamepad_FaceButton_Top_LongPressCancel()
  self.Btn_Unlock.Key_Consume:OnButtonReleased()
  self.Btn_Unlock.Key_Consume:StopAllAnimations()
  self.Btn_Unlock.Key_Consume:PlayAnimation(self.Btn_Unlock.Key_Consume.Normal)
end

function M:OnAddedToFocusPath()
  self.IsInFocusPath = true
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent, self)
  end
end

function M:OnRemovedFromFocusPath()
  self.IsInFocusPath = false
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent, self)
  end
end

function M:OnUnlockBtnParamsCreated(Params)
  function Params.OnAddedToFocusPath(_self, Widget)
  end
  
  function Params.OnRemovedFromFocusPath(_self, Widget)
  end
end

AssembleComponents(M)
return M
