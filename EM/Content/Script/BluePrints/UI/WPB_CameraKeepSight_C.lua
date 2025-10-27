require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  M.Super.Construct(self)
  self.MoveDelta = FVector2D(0, 0)
  self.Unhandle = UWidgetBlueprintLibrary.Unhandled()
  self.CaptureMouse = UWidgetBlueprintLibrary.CaptureMouse(self.Unhandle, self)
  self.IsPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:SetFocus()
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.OnMouseMove_Event then
    if self.CapturedAndRealMouseMoved and self.IsPC then
      if self.LastRealMousePos then
        local CurRealMousePos = UWidgetLayoutLibrary.GetMousePositionOnPlatform()
        self.MoveDelta = CurRealMousePos - self.LastRealMousePos
        self.MoveDelta = self.MoveDelta * 3
      end
      ULowEntryExtendedStandardLibrary.SetMousePositionInPercentages(0.5, 0.5)
      self.LastRealMousePos = UWidgetLayoutLibrary.GetMousePositionOnPlatform()
      self.CapturedAndRealMouseMoved = false
    end
    if self.bIgnoreNextMouseMove and (0 ~= self.MoveDelta.X or 0 ~= self.MoveDelta.Y) then
      self.bIgnoreNextMouseMove = false
      InDeltaTime = 0
    end
    self.MoveDelta.X = self.MoveDelta.X * InDeltaTime
    if self.IsGamepadInput then
      self.MoveDelta.Y = -self.MoveDelta.Y * InDeltaTime
    else
      self.MoveDelta.Y = self.MoveDelta.Y * InDeltaTime
    end
    self.OnMouseMove_Event(self.MoveDelta, InDeltaTime)
  end
  self.MoveDelta.X = 0
  self.MoveDelta.Y = 0
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightX" == InKeyName then
    self.CapturedAndRealMouseMoved = false
    self.MoveDelta.X = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 30
  elseif "Gamepad_RightY" == InKeyName then
    self.CapturedAndRealMouseMoved = false
    self.MoveDelta.Y = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 30
  end
  return self.Unhandle
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  return UIUtils.Handled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.bIgnoreNextMouseMove = true
  self:SetCursor(EMouseCursor.None)
  return self.CaptureMouse
end

function M:OnFocusLost(InFocusEvent)
  self:ResetCursor()
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  self:SetFocus()
  self.CapturedAndRealMouseMoved = true
  self.bIgnoreNextMouseMove = true
  self:SetCursor(EMouseCursor.None)
  return self.CaptureMouse
end

function M:OnMouseLeave(MouseEvent)
  self.CapturedAndRealMouseMoved = false
  self:ResetCursor()
  return UWidgetBlueprintLibrary.ReleaseMouseCapture(self.Unhandle)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  if UKismetInputLibrary.InputEvent_IsAltDown(MouseEvent) then
    self.CapturedAndRealMouseMoved = false
    self:ResetCursor()
  elseif self:HasFocusedDescendants() or self:HasAnyUserFocus() then
    self:SetCursor(EMouseCursor.None)
    self.CapturedAndRealMouseMoved = true
    return self.CaptureMouse
  end
  return UWidgetBlueprintLibrary.ReleaseMouseCapture(self.Unhandle)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  self.bIgnoreNextMouseMove = true
  return UIUtils.Handled
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  self.CapturedAndRealMouseMoved = false
  local CursorDelta = UE4.UKismetInputLibrary.PointerEvent_GetCursorDelta(InTouchEvent)
  self.MoveDelta.X = CursorDelta.X
  self.MoveDelta.Y = CursorDelta.Y
  return self.Unhandle
end

function M:BindEventOnMouseMove(Event)
  self.OnMouseMove_Event = Event
end

return M
