require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Tab_Prime:SetSwitchOn(true)
  self.Tab_Max:SetSwitchOn(false)
  self.Tab_Prime:BindEventOnSwitchOn(self, self.OnSwitchPrimeLevel)
  self.Tab_Max:BindEventOnSwitchOn(self, self.OnSwitchMaxLevel)
  local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  self.Tab_Prime:Update(1, {
    Text = GText("UI_Preview_Init")
  }, PlatformName)
  self.Tab_Max:Update(2, {
    Text = GText("UI_Preview_Max")
  }, PlatformName)
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
  end
  self:OnUpdateUIStyleByInputTypeChange(UIUtils.UtilsGetCurrentInputType())
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:CreateCommonKey(Info)
  self.Key_GamePad:CreateCommonKey(Info)
end

function M:UpdateState()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.Tab_Prime:UnbindEventOnSwitchOn()
  self.Tab_Max:UnbindEventOnSwitchOn()
  if ArmoryUtils:GetPreviewTargetState() == ArmoryUtils.PreviewTargetStates.Max then
    self.Tab_Prime:SetSwitchOn(false)
    self.Tab_Max:SetSwitchOn(true)
  else
    self.Tab_Prime:SetSwitchOn(true)
    self.Tab_Max:SetSwitchOn(false)
  end
  self.Tab_Prime:BindEventOnSwitchOn(self, self.OnSwitchPrimeLevel)
  self.Tab_Max:BindEventOnSwitchOn(self, self.OnSwitchMaxLevel)
end

function M:SwitchTab()
  if ArmoryUtils:GetPreviewTargetState() == ArmoryUtils.PreviewTargetStates.Max then
    self.Tab_Prime:SetSwitchOn(true)
  else
    self.Tab_Max:SetSwitchOn(true)
  end
end

function M:OnSwitchPrimeLevel()
  ArmoryUtils:SwitchPreviewTargetState(ArmoryUtils.PreviewTargetStates.Prime)
  self.Tab_Max:SetSwitchOn(false)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
end

function M:OnSwitchMaxLevel()
  ArmoryUtils:SwitchPreviewTargetState(ArmoryUtils.PreviewTargetStates.Max)
  self.Tab_Prime:SetSwitchOn(false)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
end

function M:ShowTip(TipText)
  self.Text_Lock:SetText(TipText)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
end

function M:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnUpdateUIStyleByInputTypeChange)
  end
end

return M
