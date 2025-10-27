require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})
local DispatchLevelEnum = {
  Perfect = 0,
  BigSuccess = 1,
  Success = 2,
  Fail,
  3
}

function M:Construct()
  M.Super.Construct(self)
  self:InitListenEvent()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.List_Reward:SetScrollBarVisibility(UIConst.VisibilityOp.Hidden)
    self.List_Reward:SetControlScrollbarInside(true)
  end
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  for Index, RewardId in ipairs(Params.RewardList) do
    if 1 == Index then
      self:SetRewardItem(DispatchLevelEnum.Perfect, RewardId)
    elseif 2 == Index then
      self:SetRewardItem(DispatchLevelEnum.BigSuccess, RewardId)
    elseif 3 == Index then
      self:SetRewardItem(DispatchLevelEnum.Success, RewardId)
    else
      self:SetRewardItem(DispatchLevelEnum.Fail, RewardId)
    end
  end
  self.List_Reward:SetFocus()
  self.List_Reward:NavigateToIndex(0)
end

function M:SetRewardItem(Level, RewardId)
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.Level = Level
  Content.RewardId = RewardId
  Content.UI = nil
  self.List_Reward:AddItem(Content)
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
  else
    self.UsingGamepad = true
    self.List_Reward:NavigateToIndex(0)
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

return M
