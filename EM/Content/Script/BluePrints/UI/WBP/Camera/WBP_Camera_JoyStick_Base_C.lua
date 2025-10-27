require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
local Handle = UE4.UWidgetBlueprintLibrary.Handled()
local Unhandle = UE4.UWidgetBlueprintLibrary.Unhandled()

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  self.bMouseDown = true
  self.MousePosition = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(MouseEvent)
  if self.Event_OnPointerDown then
    self.Event_OnPointerDown(self.Obj)
  end
  return UWidgetBlueprintLibrary.CaptureMouse(Handle, self)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  if self:HasMouseCapture() then
    self.MousePosition = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(MouseEvent)
    return Handle
  end
  return Unhandle
end

function M:OnMouseButtonUp(MyGeometry, InKeyEvent)
  self.bMouseDown = false
  local JoyStickCanvas = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Img_Roll)
  JoyStickCanvas:SetPosition(FVector2D(0, 0))
  if self.Event_OnPointerUp then
    self.Event_OnPointerUp(self.Obj)
  end
  return UWidgetBlueprintLibrary.ReleaseMouseCapture(Handle)
end

function M:OnMouseCaptureLost()
  local JoyStickCanvas = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Img_Roll)
  JoyStickCanvas:SetPosition(FVector2D(0, 0))
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  return self:OnMouseButtonDown(MyGeometry, InTouchEvent)
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnMouseButtonUp(MyGeometry, InTouchEvent)
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return self:OnMouseMove(MyGeometry, InTouchEvent)
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.bLocked then
    return
  end
  if self.bMouseDown and self:HasMouseCapture() then
    if not self.CenterPos then
      local AbsPos = USlateBlueprintLibrary.LocalToAbsolute(MyGeometry, FVector2D(0, 0))
      local Size = USlateBlueprintLibrary.GetAbsoluteSize(MyGeometry)
      self.CenterPos = AbsPos + Size / 2
      self.Radius = Size.X / 2
      self.HalfDesiredSize = self:GetDesiredSize() / 2
      self.JoyStickCanvas = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Img_Roll)
    end
    local Dir, Length = UKismetMathLibrary.ToDirectionAndLength2D(self.MousePosition - self.CenterPos)
    local Percentt = math.clamp(Length / self.Radius, 0, 1)
    self.JoyStickCanvas:SetPosition(self.HalfDesiredSize * Dir * Percentt)
    Dir.Y = -Dir.Y
    self.Event_OnMoved(self.Obj, Dir * InDeltaTime, Percentt)
  end
end

function M:BindEvnetOnJoyStick(Obj, Events)
  self.Obj = Obj
  self.Event_OnMoved = Events.OnMoved
  self.Event_OnPointerDown = Events.OnPointerDown
  self.Event_OnPointerUp = Events.OnPointerUp
end

function M:SetJoyStickLocked(bNewLocked)
  self.bLocked = bNewLocked
end

return M
