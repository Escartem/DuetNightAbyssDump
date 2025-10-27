require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_Com_item_Universal_L_C"
})

function M:InitData(Content)
  M.Super.InitData(self, Content)
  self.bHovered = false
  self.bPressed = false
  self.bEnableDrag = Content.bEnableDrag
  self.UnitId = Content.UnitId
  self.DragPivot = Content.DragPivot
  self.DragOffset = Content.DragOffset
  self.AudioType = Content.AudioType or self.ItemType
  self._OnUnLoadUI = Content.OnUnLoadUI
  self._OnDragCancelled = Content.OnDragCancelled
  self._OnDragEnter = Content.OnDragEnter
  self._OnDragLeave = Content.OnDragLeave
  self._CreateDragWidget = Content.CreateDragWidget
  self._OnMouseButtonDownEarly = Content.OnMouseButtonDownEarly
  self.bAllUseAsyncLoadWidget = false
end

function M:Construct()
  M.Super.Construct(self)
  self:BindToAnimationFinished(self.Item.UnHover, {
    self,
    self.OnUnHoverAnimFinished
  })
  EventManager:AddEvent(EventID.UnLoadUI, self, function(self, UIName)
    if self._OnUnLoadUI then
      self._OnUnLoadUI(self, self.Content, UIName)
    end
  end)
  self.CurAnim = self.Item.Normal
end

function M:Destruct()
  M.Super.Destruct(self)
  self:UnbindFromAnimationFinished(self.Item.UnHover, {
    self,
    self.OnUnHoverAnimFinished
  })
  EventManager:RemoveEvent(EventID.UnLoadUI, self)
end

function M:InitCompView()
  M.Super.InitCompView(self)
end

function M:TryPlayAnimation(Animation, ...)
  if self.CurAnim == Animation then
    return
  end
  self.PlayAnimParams = table.pack(...)
  local AnimToStop = self.CurAnim
  self.CurAnim = Animation
  if self.Item:IsAnimationPlaying(AnimToStop) then
    self.Item:StopAnimation(AnimToStop)
    self.Item:PlayAnimation(Animation, ...)
  elseif not self.Item:IsAnimationPlaying(Animation) then
    self.Item:PlayAnimation(Animation, ...)
  end
end

function M:SetInteractivity(bInteractive)
  self.NotInteractive = not bInteractive
end

function M:OnHoveredChanged(bHovered)
  self.bHovered = bHovered
  if self.Content.IsSelect then
    return
  end
  if bHovered then
    if self.CurAnim == self.Item.Hover then
      return
    end
    self:TryPlayAnimation(self.Item.Hover)
  else
    self:TryPlayAnimation(self.Item.UnHover)
  end
end

function M:OnPressedChanged(bPressed)
  self.bPressed = bPressed
  if self.Content.IsSelect then
    return
  end
  if bPressed then
    self:TryPlayAnimation(self.Item.Press)
  elseif self:IsHovered() and CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:TryPlayAnimation(self.Item.Hover)
  else
    self:TryPlayAnimation(self.Item.Normal)
  end
end

function M:OnUnHoverAnimFinished()
  self:CheckAndPlayCurrentAnim()
end

function M:CheckAndPlayCurrentAnim()
  if self.bPressed then
    self:TryPlayAnimation(self.Press)
  elseif self:IsHovered() then
    self:TryPlayAnimation(self.hover)
  else
    self:TryPlayAnimation(self.Normal)
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if not self.bEnableDrag then
    return
  end
  M.Super.OnMouseEnter(self, MyGeometry, MouseEvent)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if not self.bEnableDrag then
    return
  end
  M.Super.OnMouseLeave(self, MyGeometry, MouseEvent)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self._OnMouseButtonDownEarly then
    local Reply = self._OnMouseButtonDownEarly(self, self.Content, MouseEvent)
    if Reply then
      return Reply
    end
  end
  if UKismetInputLibrary.PointerEvent_IsMouseButtonDown(MouseEvent, EKeys.RightMouseButton) then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self.MouseDownPos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(MouseEvent)
  self:OnPressedChanged(true)
  return M.Super.OnMouseButtonDown(self, MyGeometry, MouseEvent)
end

function M:OnMouseCaptureLost()
  self:OnPressedChanged(false)
  self:OnHoveredChanged(false)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  CommonUtils:CloseGuideTouchIfExist(self)
  self.MouseDownPos = nil
  self:OnPressedChanged(false)
  return M.Super.OnMouseButtonUp(self, MyGeometry, MouseEvent)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  if self.bEnableDrag and self:HasMouseCapture() and self.MouseDownPos and UUIFunctionLibrary.HasTraveledFarEnoughToTriggerDrag(MouseEvent, self.MouseDownPos) then
    self.Item.ItemDetails_MenuAnchor:SetAllowRetain(false)
    self:SetSelected(false)
    self.MouseDownPos = nil
    return UWidgetBlueprintLibrary.DetectDragIfPressed(MouseEvent, self, UE4.EKeys.LeftMouseButton)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  if self.bEnableDrag then
    self.Item.ItemDetails_MenuAnchor:SetAllowRetain(false)
    self:SetSelected(false)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnDragDetected(MyGeometry, PointerEvent)
  DebugPrint("WYX ", "WBP_Com_Item_Universal_L_C::OnDragDetected")
  self:OnPressedChanged(false)
  if not self.bEnableDrag and not self._OnDragLeave then
    return
  end
  local DragDropOperation = NewObject(UIUtils.GetCommonDragDropOperationClass())
  DragDropOperation.Payload = self.Content
  if self._CreateDragWidget then
    DragDropOperation.DefaultDragVisual = self._CreateDragWidget(self.ParentWidget, self.Content)
  end
  if not DragDropOperation.DefaultDragVisual then
    return nil
  end
  DragDropOperation.Tag = "WBP_Com_Item_Universal_L_C"
  DragDropOperation.Pivot = self.DragPivot or UE4.EDragPivot.CenterCenter
  DragDropOperation.Offset = self.DragOffset or DragDropOperation.Offset
  if self.IsShowDetails then
    self.Item.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  end
  return DragDropOperation
end

function M:OnDragEnter(MyGeometry, PointerEvent, Operation)
  DebugPrint("WYX ", "WBP_Com_Item_Universal_L_C::OnDragEnter")
  if Operation.Tag ~= "WBP_Com_Item_Universal_L_C" then
    return
  end
  if self._OnDragEnter then
    self._OnDragEnter(self.ParentWidget, self.Content)
  end
  if Operation.DefaultDragVisual then
    self:OnDragEnter_Lua(Operation.DefaultDragVisual)
  end
end

function M:OnDragEnter_Lua(CreateDragUI)
  CreateDragUI.IsDraging = true
end

function M:OnDragLeave(PointerEvent, Operation)
  DebugPrint("WYX ", "WBP_Armory_Item_C::OnDragLeave")
  if Operation.Tag ~= "WBP_Com_Item_Universal_L_C" then
    return
  end
  if self._OnDragLeave then
    self._OnDragLeave(self.ParentWidget, self.Content, PointerEvent, Operation.DefaultDragVisual)
  end
end

function M:OnDragCancelled(PointerEvent, Operation)
  DebugPrint("WYX ", "WBP_Armory_Item_C::OnDragCancelled")
  if Operation.Tag ~= "WBP_Com_Item_Universal_L_C" then
    return
  end
  self:OnHoveredChanged(false)
  self:SetSelected(false)
  if self._OnDragCancelled then
    self._OnDragCancelled(self.ParentWidget, self.Content, Operation, PointerEvent)
  end
  if Operation.DefaultDragVisual then
    self:OnDragCancel_Lua(Operation.DefaultDragVisual)
  end
end

function M:OnMenuOpenChanged(IsOpened)
  UIManager(self):SetIsMenuAnchorOpen(IsOpened)
  self:SetSelected(IsOpened)
  M.Super.OnMenuOpenChanged(self, IsOpened)
end

function M:OnDragCancel_Lua(CreateDragUI)
  if not CreateDragUI.Content or CreateDragUI.IsCancel then
    return
  end
  CreateDragUI.IsDraging = false
end

function M:SetEnableDrag(IsEnableDrag)
  self.bEnableDrag = IsEnableDrag
end

function M:IsMenuOpen()
  return self.IsShowDetails and self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen()
end

function M:OnCloseMenuAnchor(IsNeedMenuChangedCallback)
  if self:IsMenuOpen() then
    self.Item.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
    if IsNeedMenuChangedCallback then
      self.Item.ItemDetails_MenuAnchor:InitMenuOpenChangedListen()
    end
    self.Item.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  end
end

function M:PlayPhantomJitterAnim()
  if self.WidgetMap[self.PhantomWidget] then
    self.PhantomWidget:PlayAnimation(self.PhantomWidget.Jitter)
  end
end

return M
