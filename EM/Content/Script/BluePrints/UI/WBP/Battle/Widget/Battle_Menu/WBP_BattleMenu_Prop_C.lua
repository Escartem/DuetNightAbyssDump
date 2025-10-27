require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnSlotPropObjectSet(Content)
  if not Content then
    return
  end
  self:SetCount(Content.ResourceCount or Content.Count)
  if Content.Icon then
    if type(Content.Icon) == "userdata" then
      self:SetIconByObj(Content.Icon)
    else
      self:SetIconByPath(Content.Icon)
    end
  end
end

function M:SetIconByPath(Path)
  self:SetIconByObj(LoadObject(Path))
end

function M:SetIconByObj(Obj)
  self.IconDynaMaterial = self.Prop_Icon:GetDynamicMaterial()
  if self.IconDynaMaterial then
    self.IconDynaMaterial:SetTextureParameterValue("MainTex", Obj)
  else
    self.Prop_Icon:SetBrushFromTexture(Obj)
  end
end

function M:SetCount(Count)
  if Count and type(Count) == "number" then
    self.Text_Num:SetText("x" .. Count)
  elseif Count and type(Count) == "string" then
    self.Text_Num:SetText(Count)
  else
    self.Text_Num:SetText("")
  end
end

function M:SetCountState(bIsEnough)
  if bIsEnough then
    self.Text_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
  else
    self.Text_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DD1C45"))
  end
end

function M:SetIconState(bIsAvailable)
  DebugPrint("gmy@SetIconState", bIsAvailable)
  if bIsAvailable then
    if self.IconDynaMaterial then
      self.IconDynaMaterial:SetScalarParameterValue("Saturation", 0.0)
    end
    self.Text_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
    self.Prop_Icon:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("FFFFFFFF"))
    if self.VX_Bg1 then
      self:SetVXVisiblity(UIConst.VisibilityOp.Visible)
    end
  else
    if self.IconDynaMaterial then
      self.IconDynaMaterial:SetScalarParameterValue("Saturation", 1.0)
    end
    self.Text_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("8D8D8DFF"))
    self.Prop_Icon:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("888888FF"))
    if self.VX_Bg1 then
      self:SetVXVisiblity(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:SetVXVisiblity(Visiblity)
  if not self.VXWidgets then
    self.VXWidgets = {}
    for key, value in pairs(self) do
      if type(key) == "string" and string.sub(key, 1, 2) == "VX" and type(value) == "userdata" and value.SetVisibility then
        table.insert(self.VXWidgets, value)
      end
    end
  end
  for _, widget in ipairs(self.VXWidgets) do
    widget:SetVisibility(Visiblity)
  end
end

function M:OnDragDetected(MyGeometry, PointerEvent)
  if self.Event_OnDragDetected then
    return self.Event_OnDragDetected(self.EventsReceiver, MyGeometry, PointerEvent)
  end
end

function M:OnMouseMove(MyGeometry, InKeyEvent)
  if self.Event_OnDragDetected and self:HasMouseCapture() then
    return UWidgetBlueprintLibrary.DetectDrag(UWidgetBlueprintLibrary.ReleaseMouseCapture(UWidgetBlueprintLibrary.Unhandled()), self, UE4.EKeys.LeftMouseButton)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return self:OnMouseMove(MyGeometry, InTouchEvent)
end

function M:OnMouseButtonUp(MyGeometry, InKeyEvent)
  if self:HasMouseCapture() then
    if self.Event_OnCaptruedMouseButtonUp then
      self.Event_OnCaptruedMouseButtonUp(self.EventsReceiver, MyGeometry, InKeyEvent)
    end
    return UWidgetBlueprintLibrary.ReleaseMouseCapture(UWidgetBlueprintLibrary.Unhandled())
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:BindEvent(EventsReceiver, Events)
  self.EventsReceiver = EventsReceiver
  self.Event_OnDragDetected = Events.OnDragDetected
  self.Event_OnCaptruedMouseButtonUp = Events.OnCaptruedMouseButtonUp
  self.Event_OnDragCancelled = Events.OnDragCancelled
end

function M:BindEventOnDragDetected(Obj, Event)
  self.EventsReceiver = Obj
  self.Event_OnDragDetected = Event
end

function M:BindEventOnCaptruedMouseButtonUp(Obj, Event)
  self.EventsReceiver = Obj
  self.Event_OnCaptruedMouseButtonUp = Event
end

function M:OnDragCancelled(PointerEvent, Operation)
  if self.Event_OnDragCancelled then
    self.Event_OnDragCancelled(self.EventsReceiver, PointerEvent, Operation)
  end
end

function M:PlayOpacityLoopAnim()
  self:StopAnimation(self.Normal)
  self:PlayAnimation(self.Opacity_Loop, 0, 0)
end

function M:StopOpacityLoopAnim()
  self:StopAnimation(self.Opacity_Loop)
  self:PlayAnimation(self.Normal)
end

return M
