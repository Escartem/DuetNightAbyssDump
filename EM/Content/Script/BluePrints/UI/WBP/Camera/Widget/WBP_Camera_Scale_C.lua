require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.List_Scale.BP_OnEntryInitialized:Clear()
  self.List_Scale.BP_OnEntryInitialized:Add(self, self.OnListEntryInitialized)
  self.EMScrollBox_0.OnUserScrolled:Clear()
  self.EMScrollBox_0.OnUserScrolled:Add(self, self.OnUserScrolled)
  self.EMScrollBox_0.OnMouseButtonDown:Add(self, self.OnScrollBoxMouseDown)
  self.EMScrollBox_0.OnMouseButtonUp:Add(self, self.OnScrollBoxMouseUp)
end

function M:DisableHover(bDisableHover)
  self.bDisableHover = bDisableHover
  if self.bDisableHover then
    self:StopAnimation(self.ScaleRuler_Normal)
    self:StopAnimation(self.ScaleRuler_UnHover)
    self:PlayAnimation(self.ScaleRuler_Hover)
  end
end

function M:Init(MinValue, MaxValue, Interval)
  self.Text_LastNum:SetText(MaxValue)
  local Max = MaxValue - Interval
  self.List_Scale:ClearListItems()
  for i = MinValue, Max, Interval do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Value = i
    self.List_Scale:AddItem(Content)
  end
  self.ScrollOffsetOfEnd = 0
  self:ResetScroll()
  if not self.bDisableHover then
    self:PlayAnimation(self.ScaleRuler_Normal)
  end
end

function M:ResetScroll()
  self.EMScrollBox_0:EndInertialScrolling()
  self:AddTimer(0.01, function()
    if self.ScrollOffsetOfEnd < 10 then
      self.ScrollOffsetOfEnd = self.EMScrollBox_0:GetScrollOffsetOfEnd()
      self:ResetScroll()
      return
    end
    self.EMScrollBox_0:SetScrollOffset(self.ScrollOffsetOfEnd / 2)
  end, false, 0, "ResetScroll", true)
end

function M:OnListEntryInitialized(Content, Widget)
  Widget.Text_Num:SetText(Content.Value)
end

function M:OnUserScrolled(CurrentOffset)
  if 0 ~= self.ScrollOffsetOfEnd and self.OnScrolledEvent then
    self.OnScrolledEvent(self.EventObj, CurrentOffset / self.ScrollOffsetOfEnd)
  end
end

function M:SetScrollPercent(Percent)
  self.EMScrollBox_0:SetScrollOffset(Percent * self.ScrollOffsetOfEnd)
end

function M:SetScrollPercentWithAnim(Percent)
  self.EMScrollBox_0:SetScrollOffset(Percent * self.ScrollOffsetOfEnd)
  self:OnMouseEnter()
  self:AddTimer(0.5, function()
    if self:IsHovered() then
      return
    end
    self:OnMouseLeave()
  end, false, 0, "SetScrollPercentWithAnim", true)
end

function M:BindEvents(Events)
  self.EventObj = Events.EventObj
  self.OnScrolledEvent = Events.OnScrolledEvent
  self.OnInertialScrollingEndEvent = Events.OnInertialScrollingEndEvent
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if self.bDisableHover then
    return
  end
  if self.bHovered then
    return
  end
  self.bHovered = true
  self:StopAnimation(self.ScaleRuler_Normal)
  self:StopAnimation(self.ScaleRuler_UnHover)
  self:PlayAnimation(self.ScaleRuler_Hover)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if self.bDisableHover then
    return
  end
  if self.bScrollBoxMouseDown then
    return
  end
  self.bHovered = false
  self:StopAnimation(self.ScaleRuler_Normal)
  self:StopAnimation(self.ScaleRuler_Hover)
  self:PlayAnimation(self.ScaleRuler_UnHover)
end

function M:OnScrollBoxMouseDown(MyGeometry, MouseEvent)
  self.bScrollBoxMouseDown = true
end

function M:OnScrollBoxMouseUp(MyGeometry, MouseEvent)
  self.EMScrollBox_0:EndInertialScrolling()
  if self.OnInertialScrollingEndEvent then
    self.OnInertialScrollingEndEvent(self.EventObj)
  end
  self.bScrollBoxMouseDown = false
  if self.bDisableHover then
    return
  end
  if self.bHovered then
    return
  end
  self:StopAnimation(self.ScaleRuler_Normal)
  self:StopAnimation(self.ScaleRuler_Hover)
  self:PlayAnimation(self.ScaleRuler_UnHover)
end

function M:SetVisibility(VisibilityOp)
  self.CanvasPanel_0:SetVisibility(VisibilityOp)
end

return M
