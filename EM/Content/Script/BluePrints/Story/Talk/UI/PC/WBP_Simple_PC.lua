require("UnLua")
local WBP_Simple_PC = Class("BluePrints.Story.Talk.UI.Common.WBP_Simple_Common")

function WBP_Simple_PC:OnLoaded(...)
  WBP_Simple_PC.Super.OnLoaded(self, ...)
  self:RefreshBaseInfo()
end

function WBP_Simple_PC:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("WBP_Simple_PC:RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  self.IsGamePad = IsGamePad
  if self.DialogueButtonListView then
    self.DialogueButtonListView:UpdateKeyImg(IsGamePad, CurGamepadName)
  end
  if IsGamePad then
    self:SetFocus()
  else
  end
  self.WBP_Story_PlayKey_P:UpdateKeyImg(IsGamePad)
end

function WBP_Simple_PC:ClearOptions()
  WBP_Simple_PC.Super.ClearOptions(self)
  self:RefreshBaseInfo()
end

function WBP_Simple_PC:ShowOptions(TalkTask, OptionTexts, OptionData, OnOptionItemClicked)
  WBP_Simple_PC.Super.ShowOptions(self, TalkTask, OptionTexts, OptionData, OnOptionItemClicked)
  self:RefreshBaseInfo()
end

function WBP_Simple_PC:InitPlayKey()
  self.WBP_Story_PlayKey_P:Init(self.IsGamePad)
end

function WBP_Simple_PC:InitAutoPlay()
end

function WBP_Simple_PC:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.DialogueButtonListView then
    return UIUtils.Unhandled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_LeftX" == InKeyName then
    self.MoveDeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  elseif "Gamepad_LeftY" == InKeyName then
    self.MoveDeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  end
  local InKeyName
  if self.MoveDeltaY and 0 ~= self.MoveDeltaY then
    if self.MoveDeltaY > 0.5 then
      InKeyName = "Gamepad_LeftStick_Up"
    elseif self.MoveDeltaY < -0.5 then
      InKeyName = "Gamepad_LeftStick_Down"
    end
  end
  if "Gamepad_LeftStick_Up" == InKeyName then
    if self.CdTimer then
      return UIUtils.Unhandled
    else
      self:CreateCDTimer()
    end
    self.DialogueButtonListView:UpSelectAction()
  elseif "Gamepad_LeftStick_Down" == InKeyName then
    if self.CdTimer then
      return UIUtils.Unhandled
    else
      self:CreateCDTimer()
    end
    self.DialogueButtonListView:DownSelectAction()
  end
  return UIUtils.Handled
end

function WBP_Simple_PC:CreateCDTimer()
  self.CdTimer = self:AddTimer(0.2, function()
    self.CdTimer = nil
  end, nil, nil, nil, true)
end

function WBP_Simple_PC:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if not self.DialogueButtonListView then
    return UIUtils.Unhandled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local Handled = true
  if "Gamepad_DPad_Up" == InKeyName then
    self.DialogueButtonListView:UpSelectAction()
  elseif "Gamepad_DPad_Down" == InKeyName then
    self.DialogueButtonListView:DownSelectAction()
  end
  return UIUtils.Unhandled
end

return WBP_Simple_PC
