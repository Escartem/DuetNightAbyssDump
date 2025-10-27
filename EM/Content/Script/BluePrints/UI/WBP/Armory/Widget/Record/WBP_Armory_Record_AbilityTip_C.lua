require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimFinished
  })
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self:RefreshBaseInfo()
end

function M:Init(Owner, Params)
  self:SetFocus()
  self.Owner = Owner
  self.OnMenuClosed = Params.OnMenuClosed
  self.OnMenuRealClosed = Params.OnMenuRealClosed
  self.Name_Ability:SetText(Params.Name)
  self.Text_Desc:SetText(Params.Description)
  self.Icon_Ability:SetIcon(Params.Icon)
  self.Icon_Ability:SetDispathchColor(Params.DispatchTag)
  if Params.Unlocked then
    self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Hint:SetText(Params.HintText)
  end
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
end

function M:OnOutAnimFinished()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.OnMenuRealClosed then
    self.OnMenuRealClosed(self.Owner)
  end
end

function M:OnFocusLost()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  if self.OnMenuClosed then
    self.OnMenuClosed(self.Owner)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  if UKismetInputLibrary.InputEvent_IsRepeat(InputEvent) then
    return UIUtils.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonRight or "Escape" == InKeyName then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Owner)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseGamepad = CurInputDevice == ECommonInputType.Gamepad
  if IsUseGamepad then
    self.Panel_Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.CurInputDevice = CurInputDevice
end

return M
