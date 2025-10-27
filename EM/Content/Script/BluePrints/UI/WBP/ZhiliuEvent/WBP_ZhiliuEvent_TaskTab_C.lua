require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitTaskTab(ParentUI, TabIndex, Condition)
  self.ParentUI = ParentUI
  self.TabIndex = TabIndex
  self.IsSelected = false
  self.IsCompleted = false
  self.IsLocked = false
  self.Image_Lock:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if "Completed" == Condition then
    self:SetCompleted()
  elseif "Normal" == Condition then
  elseif "Locked" == Condition then
    self:SetLocked()
  end
  self:InitBindEvents()
  self:InitDisplayText()
end

function M:InitBindEvents()
  self.Btn_Tab.OnClicked:Add(self, self.OnClickedEvent)
  self.Btn_Tab.OnPressed:Add(self, self.OnPressedEvent)
  self.Btn_Tab.OnHovered:Add(self, self.OnHoverdEvent)
  self.Btn_Tab.OnUnhovered:Add(self, self.OnUnHoveredEvent)
end

function M:OnClickedEvent()
  if self.IsLocked then
    self.ParentUI:OnDaySwitchButtonLockedClicked(self.TabIndex)
  else
    self:PlayAnimation(self.Click)
    self.ParentUI:OnDaySwitchButtonClicked(self.TabIndex)
    self.IsSelected = true
  end
end

function M:OnPressedEvent()
  if self.IsLocked then
    return
  end
  self.IsSelected = true
end

function M:OnHoverdEvent()
  if self.IsSelected then
    return
  end
  if self.IsLocked then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:OnUnHoveredEvent()
  if self.IsSelected then
    return
  end
  if self.IsLocked then
    return
  end
  self:PlayAnimation(self.Normal)
end

function M:SetNormal()
  if self.IsLocked then
    return
  end
  self.IsSelected = false
  self:PlayAnimation(self.Normal)
end

function M:SetLocked()
  self.IsLocked = true
  self:PlayAnimation(self.Lock)
end

function M:SetCompleted()
  self.IsCompleted = true
  self:PlayAnimation(self.Completed)
end

function M:InitDisplayText()
  self.Text_TabNum:SetText("0" .. self.TabIndex)
end

return M
