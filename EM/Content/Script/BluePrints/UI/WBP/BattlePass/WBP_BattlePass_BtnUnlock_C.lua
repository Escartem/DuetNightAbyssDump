require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitBtnInfo(State, Label, Callback, bIsDiscount, OriginPrice, KeyShortPath, bLongPress)
  DebugPrint("gmy@WBP_BattlePass_BtnUnlock_C M:InitBtnInfo", State, Label, Callback, bIsDiscount, OriginPrice, os.time())
  self.KeyShortPath = KeyShortPath
  self.bLongPress = bLongPress
  self.Text_Button:SetText(GText(Label))
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnReleased:Clear()
  self.Button_Area.OnHovered:Clear()
  self.Button_Area.OnUnhovered:Clear()
  self.Button_Area.OnClicked:Add(self, Callback)
  self.Button_Area.OnHovered:Add(self, function()
    self:PlayAnimation(self.Hover)
  end)
  self.Button_Area.OnUnhovered:Add(self, function()
    self:PlayAnimation(self.UnHover)
  end)
  self.Button_Area.OnPressed:Add(self, function()
    self:PlayAnimation(self.Press)
  end)
  if "Forbidden" == State then
    self.Button_Area:SetForbidden(true)
    self:PlayAnimation(self.Forbidden)
  elseif "UnlockForbidden" == State then
    self.Button_Area:SetForbidden(true)
    self:PlayAnimation(self.UnlockForbidden)
  else
    self:PlayAnimation(self.Normal)
  end
  if bIsDiscount then
    self.Panel_Discount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Discount:SetText(GText("BATTLEPASS_DISCOUNT_LABEL"))
    self.Panel_Cancel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Cancel:SetText(OriginPrice)
  else
    self.Panel_Discount:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:InitInputSettings()
end

function M:InitBtnInfo_GetAll(State, Label, Callback, KeyShortPath, bLongPress)
  self.KeyShortPath = KeyShortPath
  self.bLongPress = bLongPress
  self.Text_Button:SetText(GText(Label))
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnReleased:Clear()
  self.Button_Area.OnHovered:Clear()
  self.Button_Area.OnUnhovered:Clear()
  self.Button_Area.OnClicked:Add(self, Callback)
  self.Button_Area.OnHovered:Add(self, function()
    self:PlayAnimation(self.Hover)
  end)
  self.Button_Area.OnUnhovered:Add(self, function()
    self:PlayAnimation(self.UnHover)
  end)
  self.Button_Area.OnPressed:Add(self, function()
    self:PlayAnimation(self.Press)
  end)
  if "Forbidden" == State then
    self.Button_Area:SetForbidden(true)
    self:PlayAnimation(self.Forbidden)
  elseif "UnlockForbidden" == State then
    self.Button_Area:SetForbidden(true)
    self:PlayAnimation(self.UnlockForbidden)
  else
    self:PlayAnimation(self.Normal)
  end
  self:InitInputSettings()
end

function M:InitInputSettings()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = self.KeyShortPath
      }
    }
  })
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("gmy@WBP_BattlePass_BtnUnlock_C M:RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
    else
    end
  end
end

function M:Destruct()
  self.Button_Area.OnClicked:Clear()
end

return M
