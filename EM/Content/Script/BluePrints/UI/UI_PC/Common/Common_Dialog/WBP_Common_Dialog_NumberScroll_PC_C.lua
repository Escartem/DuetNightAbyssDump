require("UnLua")
local WBP_Common_Dialog_NumberScroll_PC_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Common_Dialog_NumberScroll_PC_C:InitContent(NumberRequired)
  self.NumberScrollBox.OnUserScrolled:Add(self, self.OnScrolled)
  self.NumberScrollBox.OnMouseButtonUp:Add(self, self.OnMouseButtonUp)
  self.NumberScrollBox.OnMouseButtonDown:Add(self, self.OnMouseButtonDown)
  self.NumberScrollBox.OnMouseWheel:Add(self, self.OnMouseWheel)
  self:InitNumbers(NumberRequired)
  self.ScrollBoxHeight = self.NumberScrollBox:GetDesiredSize().Y
  self.BorderHeight = self.Border_Up:GetDesiredSize().Y
  self.LastScrollOffset = nil
  self.IsMouseDown = false
  self.SelectedWidget = nil
end

function WBP_Common_Dialog_NumberScroll_PC_C:InitNumbers(NumberRequired)
  self.NumberScrollBox:RemoveChildAt(self.NumberScrollBox:GetChildrenCount() - 1)
  self.NumberWidgets = {}
  for i = 1, NumberRequired do
    local Widget = UE4.UWidgetBlueprintLibrary.Create(self, self.DialogNumberCls)
    Widget:PlayAnimation(Widget.Normal)
    Widget.Text_Number:SetText(i)
    self.NumberScrollBox:AddChild(Widget)
    table.insert(self.NumberWidgets, Widget)
  end
  self.NumberScrollBox:AddChild(self.Border_Down)
end

function WBP_Common_Dialog_NumberScroll_PC_C:ResetNumbers(NumberRequired)
  self.NumberScrollBox:RemoveChildAt(self.NumberScrollBox:GetChildrenCount() - 1)
  local CurrentNumber = #self.NumberWidgets
  if NumberRequired > CurrentNumber then
    for i = CurrentNumber + 1, NumberRequired do
      local Widget = UE4.UWidgetBlueprintLibrary.Create(self, self.DialogNumberCls)
      Widget:PlayAnimation(Widget.Normal)
      Widget.Text_Number:SetText(i)
      self.NumberScrollBox:AddChild(Widget)
      table.insert(self.NumberWidgets, Widget)
    end
  else
    for i = CurrentNumber, NumberRequired + 1, -1 do
      self.NumberScrollBox:RemoveChildAt(i)
      self.NumberWidgets[i] = nil
    end
  end
  self.NumberScrollBox:AddChild(self.Border_Down)
end

function WBP_Common_Dialog_NumberScroll_PC_C:BindOnNumberSelected(Obj, Callback)
  self.NumberSelectedObj = Obj
  self.NumberSelectedCallback = Callback
end

function WBP_Common_Dialog_NumberScroll_PC_C:OnScrolled(CurrentOffset)
  if self.NumberRequired and self.NumberRequired ~= #self.NumberWidgets then
    self:ResetNumbers(self.NumberRequired)
  end
  local Index = self:FindClosestWidgetIndex(CurrentOffset)
  local Widget = self.NumberWidgets[Index]
  if not self.SelectedWidget or self.SelectedWidget ~= Widget then
    Widget:PlayAnimation(Widget.In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/date_roll_rotate", nil, nil)
    if self.SelectedWidget then
      self.SelectedWidget:PlayAnimation(self.SelectedWidget.Out)
    end
    self.SelectedWidget = Widget
  end
end

function WBP_Common_Dialog_NumberScroll_PC_C:OnMouseButtonUp(MyGeometry, InKeyEvent)
  self:SetToCloestNumber()
  self.IsMouseDown = false
end

function WBP_Common_Dialog_NumberScroll_PC_C:OnMouseWheel(MyGeometry, InKeyEvent)
  local Params = {}
  Params.ByWheel = true
  local WheelDelta = UE4.UKismetInputLibrary.PointerEvent_GetWheelDelta(InKeyEvent)
  if -1 == WheelDelta then
    Params.Down = true
  end
  self:SetToCloestNumber(Params)
end

function WBP_Common_Dialog_NumberScroll_PC_C:SetToCloestNumber(Params)
  local ClosestIndex = self:FindClosestWidgetIndex(self.NumberScrollBox:GetScrollOffset())
  if Params and Params.ByWheel and self.SelectedNumber == ClosestIndex then
    if Params.Down then
      ClosestIndex = math.min(ClosestIndex + 1, #self.NumberWidgets)
    else
      ClosestIndex = math.max(ClosestIndex - 1, 1)
    end
  end
  local ClosestWidget = self.NumberWidgets[ClosestIndex]
  if ClosestWidget then
    self.NumberScrollBox:EndInertialScrolling()
    self.NumberScrollBox:ScrollWidgetIntoView(ClosestWidget, true, UE4.EDescendantScrollDestination.Center)
    self.SelectedNumber = ClosestIndex
    if self.NumberSelectedObj and self.NumberSelectedCallback then
      self.NumberSelectedCallback(self.NumberSelectedObj, ClosestIndex)
    end
  end
end

function WBP_Common_Dialog_NumberScroll_PC_C:OnMouseButtonDown(MyGeometry, InKeyEvent)
  self.IsMouseDown = true
  self.LastScrollOffset = nil
end

function WBP_Common_Dialog_NumberScroll_PC_C:NavigateTo(TargetNumber)
  self:AddTimer(0.2, function()
    self:_NavigateTo(TargetNumber)
  end, false)
end

function WBP_Common_Dialog_NumberScroll_PC_C:_NavigateTo(TargetNumber)
  TargetNumber = math.floor(math.clamp(TargetNumber, 1, #self.NumberWidgets))
  local TargetWidget = self.NumberWidgets[TargetNumber]
  self.NumberScrollBox:ScrollWidgetIntoView(TargetWidget, true, UE4.EDescendantScrollDestination.Center)
end

function WBP_Common_Dialog_NumberScroll_PC_C:GetSelectedNumber()
  local Index = self:FindClosestWidgetIndex(self.NumberScrollBox:GetScrollOffset())
  return Index
end

function WBP_Common_Dialog_NumberScroll_PC_C:ScrollToNextNumber()
  local CurNumber = self:GetSelectedNumber()
  if CurNumber < #self.NumberWidgets then
    self:_NavigateTo(CurNumber + 1)
  end
end

function WBP_Common_Dialog_NumberScroll_PC_C:ScrollToPreviousNumber()
  local CurNumber = self:GetSelectedNumber()
  if CurNumber > 1 then
    self:_NavigateTo(CurNumber - 1)
  end
end

function WBP_Common_Dialog_NumberScroll_PC_C:FindClosestWidgetIndex(ScrollOffset)
  if #self.NumberWidgets <= 0 then
    return nil
  end
  local WidgetHeight = self.NumberWidgets[1]:GetDesiredSize().Y
  local ScrollCenterOffset = ScrollOffset + self.ScrollBoxHeight / 2
  if ScrollCenterOffset <= self.BorderHeight then
    return 1
  elseif ScrollCenterOffset > self.NumberScrollBox:GetScrollOffsetOfEnd() - self.BorderHeight then
    return #self.NumberWidgets
  else
    local Index = math.clamp((ScrollCenterOffset - self.BorderHeight) // WidgetHeight + 1, 1, #self.NumberWidgets)
    return Index
  end
end

function WBP_Common_Dialog_NumberScroll_PC_C:AddDeltaOffset(DeltaOffset)
  if math.abs(DeltaOffset) < 10 then
    if self.IsGamepadScrolling then
      self:SetToCloestNumber()
      self.IsGamepadScrolling = false
    end
    return
  else
    self.IsGamepadScrolling = true
  end
  local CurrentOffset = self.NumberScrollBox:GetScrollOffset()
  local OffsetToEnd = self.NumberScrollBox:GetScrollOffsetOfEnd()
  local NextOffset = math.clamp(CurrentOffset + DeltaOffset, self.BorderHeight, OffsetToEnd - self.BorderHeight)
  self.NumberScrollBox:SetScrollOffset(NextOffset)
end

return WBP_Common_Dialog_NumberScroll_PC_C
