require("UnLua")
local FEntertainmentUtils = require("BluePrints.UI.WBP.Entertainment.EntertainmentUtils")
local EPartyTopicState = FEntertainmentUtils.EPartyTopicState
local LockedState = {
  [EPartyTopicState.NotMeetLastPartyTopic] = true,
  [EPartyTopicState.NotMeetCondition] = true,
  [EPartyTopicState.NotMeetResource] = true,
  [EPartyTopicState.RedeemResource] = true,
  [EPartyTopicState.CanUnlockPartyTopic] = true
}
local UnLockState = {
  [EPartyTopicState.CanStartPartyTopic] = true,
  [EPartyTopicState.CanReviewPartyTopic] = true
}
local ContinueState = {
  [EPartyTopicState.CanReviewPartyTopic] = true,
  [EPartyTopicState.RedeemResource] = true
}
local M = Class("BluePrints.UI.WBP.Entertainment.Widget.WBP_Entertainment_TopicDetail_C")

function M:Construct()
  M.Super.Construct(self)
  self.Key_Controller_Topic:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Vertical"}
    }
  })
  self.Key_Controller_Continue:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_Controller_Unlock:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
end

function M:OnGamePadKeyPreviewDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadDPadUp then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
    self:SwitchUpTab()
    return true
  elseif InKeyName == Const.GamepadDPadDown then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
    self:SwitchDownTab()
    return true
  elseif InKeyName == Const.GamepadDPadRight then
    return true
  elseif InKeyName == Const.GamepadDPadLeft then
    return true
  end
end

function M:OnGamePadKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.HandleKeyDown then
    return false
  end
  if InKeyName == Const.GamepadFaceButtonUp then
    self.HandleKeyDown = true
    if not ContinueState[self:GetState()] then
      self:PlayAnimation(self.UnLock_Press)
    else
      self:PlayAnimation(self.Continue_Press)
    end
    return true
  end
end

function M:OnGamePadKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if not self.HandleKeyDown then
    return false
  end
  if InKeyName == Const.GamepadFaceButtonUp then
    self.HandleKeyDown = false
    if IsValid(self.EnableButton) then
      if not ContinueState[self:GetState()] then
        self:PlayAnimation(self.UnLock_Click)
      else
        self:PlayAnimation(self.Continue_Click)
      end
      self.EnableButton.OnClicked:Broadcast()
      return true
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Key_Controller_Topic:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Controller_Continue:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Controller_Unlock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Controller_Topic:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Controller_Continue:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Controller_Unlock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:BP_GetDesiredFocusTarget()
  local State = self:GetState()
  if LockedState[State] then
    return self.List_Material
  elseif UnLockState[State] then
    return self.Badge
  else
    return self
  end
end

function M:SetTab(...)
  M.Super.SetTab(self, ...)
  self.HandleKeyDown = false
  local State = self:GetState()
  if LockedState[State] then
    self.List_Material:NavigateToIndex(0)
    self.List_Material:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    self.List_Reward:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Escape)
  elseif UnLockState[State] then
    self.Badge:SetFocus()
    self.List_Reward:SetNavigationRuleExplicit(EUINavigation.Up, self.Badge)
    self.Badge:SetNavigationRuleExplicit(EUINavigation.Down, self.List_Reward)
  else
    self:SetFocus()
  end
  self:StopAnimation(self.UnLock_Press)
  self:StopAnimation(self.Continue_Press)
  self:PlayAnimation(self.UnLock_Normal)
  self:PlayAnimation(self.Continue_Normal)
end

function M:ClosePanel(...)
  M.Super.ClosePanel(self, ...)
  self.HandleKeyDown = false
  self:StopAnimation(self.UnLock_Press)
  self:StopAnimation(self.Continue_Press)
  self:PlayAnimation(self.UnLock_Normal)
  self:PlayAnimation(self.Continue_Normal)
end

return M
