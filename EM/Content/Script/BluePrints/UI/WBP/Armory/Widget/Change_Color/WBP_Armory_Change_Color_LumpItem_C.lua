require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnPressed:Clear()
  self.Btn_Click.OnHovered:Clear()
  self.Btn_Click.OnUnhovered:Clear()
  self.Btn_Click.OnReleased:Clear()
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
  self.Btn_Click.OnReleased:Add(self, self.OnReleased)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Widget = self
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self:StopAllAnimations()
  self:FlushAnimations()
  self:SetColor(Content.Color)
  self:SetIsSelected(Content.IsSelected, 1000)
  if Content.IsClicked then
    self:PlayAnimation(self.Click, 0, 1, 0, 1000)
  end
  if not Content.IsSelected and not Content.IsClicked then
    self:PlayAnimation(self.Normal, 0, 1, 0, 1000)
    self.VX_Press:SetRenderOpacity(0)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:SetColor(Color)
  self.Img_CircleLump.Brush.TintColor.SpecifiedColor = Color
end

function M:SetIsSelected(IsSelected, Speed)
  if IsSelected then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Select, 0, 1, 0, Speed or 1)
  else
    self:StopAnimation(self.Select)
    self.Img_CheckBG:SetRenderOpacity(0)
    self.Img_Check:SetRenderOpacity(0)
    self.VX_White:SetRenderOpacity(0)
  end
end

function M:OnPressed()
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationForward(self.Press)
end

function M:OnClicked()
  self:OnDefaultColorClicked()
  if self.Content.IsClicked then
    return
  end
  self.Content.IsClicked = true
  self:PlayAnimation(self.Click, 0, 1, 0, 1)
end

function M:OnUnclicked()
  self.Content.IsClicked = false
  self:StopAnimation(self.Click)
  self:FlushAnimations()
  if self.Content.IsSelected then
    self.Img_CheckFrame:SetRenderOpacity(0)
  else
    self:PlayAnimation(self.Normal, 0, 1, 0)
  end
end

function M:SetIsClicked(IsClicked, Speed)
  if IsClicked then
    self:PlayAnimation(self.Click, 0, 1, 0, Speed or 1)
  else
    self:StopAnimation(self.Click)
    self:FlushAnimations()
    if self.Content.IsSelected then
      self.Img_CheckFrame:SetRenderOpacity(0)
    else
      self:PlayAnimation(self.Normal, 0, 1, 0)
    end
  end
end

function M:OnHovered()
  if self.Content.Event_OnHovered then
    self.Content.Event_OnHovered(self.Content.Owner, self.Content)
  end
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationForward(self.Hover)
end

function M:OnUnhovered()
  if self.Content.Event_OnUnhovered then
    self.Content.Event_OnUnhovered(self.Content.Owner, self.Content)
  end
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationReverse(self.Hover)
end

function M:OnClicked()
  if self.Content.Event_OnClicked then
    self.Content.Event_OnClicked(self.Content.Owner, self.Content)
  end
  if self.Content.IsClicked then
    return
  end
  self.Content.IsClicked = true
  self:PlayAnimation(self.Click)
end

function M:OnUnclicked()
  self.Content.IsClicked = false
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  if self.Content.IsSelected then
    self.Img_CheckFrame:SetRenderOpacity(0)
    self.VX_Hover:SetRenderOpacity(0)
  end
end

function M:OnReleased()
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationReverse(self.Press)
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

return M
