require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init(Param)
  self.RootPage = Param.RootPage
  self.SuccCallBack = Param.SuccCallBack
  self.ResetCallBack = Param.ResetCallBack
  self.Text_Crack:SetText(GText("UI_MiniGame_Decode"))
  self.NeedCrack = Param.NeedCrack
  self.NeedReset = Param.NeedReset
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
  self.CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshInfoByInputTypeChange(self.CurMode)
  self:InitCrackButton()
  self:InitResetButton()
  self:PlayAnim()
end

function M:InitCrackButton()
  if not self.NeedCrack then
    self.Panel_Crack:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.CrackHover = false
  self.CrackPress = false
  self.Key_Crack_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_Crack:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "F"}
    }
  })
  self.Btn_Crack.OnClicked:Add(self, self.OnClickCrackButton)
  self.Btn_Crack.OnHovered:Add(self, self.OnHoverCrackButton)
  self.Btn_Crack.OnUnhovered:Add(self, self.OnUnhovereCrackButton)
  self.Btn_Crack.OnPressed:Add(self, self.OnPressCrackButton)
  self.Btn_Crack.OnReleased:Add(self, self.OnReleaseCrackButton)
end

function M:OnClickCrackButton()
  if not self.NeedCrack then
    return
  end
  self.SuccCallBack(self.RootPage)
end

function M:OnHoverCrackButton()
  self.CrackHover = true
  self:PlayAnimation(self.Crack_Hover)
end

function M:OnUnhovereCrackButton()
  self.CrackHover = false
  if not self.CrackPress then
    self:PlayAnimation(self.Crack_UnHover)
    self:PlayAnimation(self.Crack_Normal)
  end
end

function M:OnPressCrackButton()
  self.CrackPress = true
  self:PlayAnimation(self.Crack_Press)
end

function M:OnReleaseCrackButton()
  self.CrackPress = false
  if self.CrackHover then
    self:PlayAnimation(self.Crack_Click)
  else
    self:PlayAnimation(self.Crack_Normal)
  end
end

function M:InitResetButton()
  if not self.NeedReset then
    self.Panel_Reset:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.ResetHover = false
  self.ReserPress = false
  self.Key_Reset_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Btn_Reset.OnClicked:Add(self, self.OnClickResetButton)
  self.Btn_Reset.OnHovered:Add(self, self.OnHoverResetButton)
  self.Btn_Reset.OnUnhovered:Add(self, self.OnUnhovereResetButton)
  self.Btn_Reset.OnPressed:Add(self, self.OnPressResetButton)
  self.Btn_Reset.OnReleased:Add(self, self.OnReleaseResetButton)
end

function M:OnClickResetButton()
  if not self.NeedReset then
    return
  end
  if self.CurMode ~= ECommonInputType.MouseAndKeyboard then
    self:PlayAnimation(self.Reset_Click)
  end
  self.ResetCallBack(self.RootPage)
end

function M:OnHoverResetButton()
  self.ResetHover = true
  self:PlayAnimation(self.Reset_Hover)
end

function M:OnUnhovereResetButton()
  self.ResetHover = false
  if not self.ReserPress then
    self:PlayAnimation(self.Reset_UnHover)
    self:PlayAnimation(self.Reset_Normal)
  end
end

function M:OnPressResetButton()
  self.ReserPress = true
  self:PlayAnimation(self.Reset_Press)
end

function M:OnReleaseResetButton()
  self.ReserPress = false
  if self.ResetHover then
    self:PlayAnimation(self.Reset_Click)
  else
    self:PlayAnimation(self.Reset_Normal)
  end
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  self.CurMode = CurInputDevice
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.Key_Reset_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
    if self.NeedReset then
      self.Key_Reset_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  elseif CurInputDevice == ECommonInputType.Touch then
    self.WidgetSwitcher_Key:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Reset_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:PlayAnim()
  if self.NeedCrack and self.NeedReset then
    self:PlayAnimation(self.Both)
  elseif not self.NeedCrack and self.NeedReset then
    self:PlayAnimation(self.Restart)
  elseif self.NeedCrack and not self.NeedReset then
    self:PlayAnimation(self.Crack)
  end
end

function M:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshInfoByInputTypeChange)
  end
end

return M
