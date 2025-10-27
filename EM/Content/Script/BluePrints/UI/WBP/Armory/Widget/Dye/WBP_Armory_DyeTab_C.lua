require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Widget = self
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self._OnHovered = Content.OnHovered
  self:StopAllAnimations()
  self:FlushAnimations()
  self:SetText(Content.Text)
  self:SetColor(Content.Color, 1000, true)
  if Content.IsSelected then
    self:PlayAnimation(self.Click, 0, 1, 0, 1)
  else
    self:PlayAnimation(self.Normal, 0, 1, 0, 10)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:SetColor(Color, Speed, bInit)
  self:StopAnimation(self.Normal)
  if Color then
    self:StopAnimation(self.UnChange)
    local ChangeColorAnim = bInit and self.Changed or self.Color_Change
    self.Img_Color.Brush.TintColor.SpecifiedColor = Color
    self:PlayAnimation(ChangeColorAnim, 0, 1, 0, Speed or 1)
  else
    self:PlayAnimation(self.UnChange, 0, 1, 0, Speed or 1)
  end
end

function M:SetText(Text)
  self.Text_Num:SetText(Text)
end

function M:Construct()
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnPressed:Clear()
  self.Btn_Click.OnHovered:Clear()
  self.Btn_Click.OnUnhovered:Clear()
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:BindEventOnClicked(Obj, Event, Params)
  self.Obj = Obj
  self.Event = Event
end

function M:OnClicked()
  if self.Content.IsSelected then
    return
  end
  self:StopAnimation(self.Normal)
  self:FlushAnimations()
  self:PlayAnimation(self.Click)
  if self.Event then
    self.Event(self.Obj, self.Content)
  end
end

function M:OnPressed()
  if self.Content.IsSelected then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnHovered()
  if self.Content.IsSelected then
    return
  end
  self:StopAnimation(self.Unhover)
  self:FlushAnimations()
  self:PlayAnimation(self.Hover)
  if self._OnHovered then
    self._OnHovered(self.Owner, self.Content)
  end
end

function M:OnUnhovered()
  if self.Content.IsSelected then
    return
  end
  self:StopAnimation(self.Hover)
  self:FlushAnimations()
  self:PlayAnimation(self.Unhover)
end

function M:OnUnclicked()
  self:StopAllAnimations()
  self:FlushAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self.Content)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self.Content)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Click)
end

return M
