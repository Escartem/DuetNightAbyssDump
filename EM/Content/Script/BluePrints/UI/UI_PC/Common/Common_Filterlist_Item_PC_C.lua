require("UnLua")
local M = Class("BluePrints.Common.TimerMgr")

function M:OnListItemObjectSet(Obj)
  self.Obj = Obj
  self.Obj.Entry = self
  self.Text_On:SetText(GText(Obj.Text))
  self.Text_Off:SetText(GText(Obj.Text))
  if self.Obj.IsSelected then
    self.Switcher:SetActiveWidgetIndex(0)
    self.Image_Chose:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Image_Chose:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Switcher:SetActiveWidgetIndex(1)
  end
  self.Panel_Hovered:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnEntryHoveredChanged(IsHovered)
  self.Switcher:SetActiveWidgetIndex(0)
  if IsHovered then
    if not self.Obj.IsSelected then
      self.Image_Chose:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self:RemoveTimer("Hover_Out")
    self:StopAnimation(self.Hover_Out)
    self:PlayAnimation(self.Hover_In)
    self.Panel_Hovered:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self:StopAnimation(self.Hover_In)
    self:PlayAnimation(self.Hover_Out)
    if not self.Obj.IsSelected then
      self.Image_Chose:SetVisibility(UIConst.VisibilityOp.Collapsed)
      local EndTime = self.Hover_Out:GetEndTime()
      
      local function func()
        self.Switcher:SetActiveWidgetIndex(1)
        self.Panel_Hovered:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      
      self:AddTimer(EndTime, func, false, 0, "Hover_Out")
    end
  end
end

function M:OnEntryClicked()
  UIUtils.PlayCommonBtnSe(self)
  self:PlayAnimation(self.Press)
end

function M:OnEntrySelectionChanged()
  if self.Obj.IsSelected then
    self.Switcher:SetActiveWidgetIndex(0)
    self.Image_Chose:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Switcher:SetActiveWidgetIndex(1)
    self.Image_Chose:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:GetInAnimTime()
  return self.Text_In:GetEndTime()
end

function M:GetOutAnimTime()
  return self.Text_Out:GetEndTime()
end

function M:PlayInAnim()
  self:StopAnimation(self.Text_Out)
  self:PlayAnimation(self.Text_In)
end

function M:PlayOutAnim()
  self:StopAnimation(self.Text_In)
  self:PlayAnimation(self.Text_Out)
end

return M
