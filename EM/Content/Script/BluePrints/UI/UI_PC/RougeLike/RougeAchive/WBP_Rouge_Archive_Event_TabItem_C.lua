require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Tab.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Tab.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Tab.OnUnhovered:Add(self, self.OnCellUnhovered)
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.Index = Content.Index
  self.EventId = Content.EventId
  self.IsUnlocked = Content.IsUnlocked
  self.Name = Content.Name
  self.IsSelected = Content.IsSelected
  self.Parent = Content.Parent
  self:InitInfo()
end

function M:InitInfo()
  if self.IsUnlocked then
    self.WS_Select:SetActiveWidgetIndex(0)
  else
    self:PlayAnimation(self.Forbidden)
    self.WS_Select:SetActiveWidgetIndex(1)
    return
  end
  self.Text_TabIndex:SetText(self.Index + 1)
  if self.IsSelected then
    self:PlayAnimation(self.Click)
  end
end

function M:OnCellClicked()
  if self.IsSelected then
    if self.Parent.FirstSelectItem then
      self.Parent.FirstSelectItem.Btn_Click:SetFocus()
    else
      self.Parent:OnIteratorDialogue()
    end
    return
  end
  if self.Parent.NextEventId then
    return
  end
  self.Parent:ChooseEvent(self.EventId, self.Name, self.IsUnlocked, self.Index, self)
  self:PlayAnimation(self.Click)
  self.IsSelected = true
end

function M:OnCellHovered()
  if not self.IsSelected then
    self:PlayAnimation(self.Hover)
  end
end

function M:OnCellUnhovered()
  if not self.IsSelected then
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function M:BP_OnItemSelectionChanged(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
    if self.Parent.NextEventId then
      if self.IsUnlocked then
        self:PlayAnimation(self.Normal)
      else
        self:PlayAnimation(self.Forbidden)
      end
      self.IsSelected = false
      return
    end
    self.Parent:ChooseEvent(self.EventId, self.Name, self.IsUnlocked, self.Index, self)
    self:PlayAnimation(self.Click)
  else
    self:StopAnimation(self.Click)
    if self.IsUnlocked then
      self:PlayAnimation(self.Normal)
    else
      self:PlayAnimation(self.Forbidden)
    end
  end
end

return M
