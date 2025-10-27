require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnHovered:Clear()
  self.Button_Area.OnUnhovered:Clear()
  self.Button_Area.OnClicked:Add(self, self.OnClicked)
  self.Button_Area.OnPressed:Add(self, self.OnPressed)
  self.Button_Area.OnHovered:Add(self, self.OnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.Widget = self
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self:StopAnimation(self.Select)
  self:StopAnimation(self.Click)
  self:StopAnimation(self.Normal)
  self:FlushAnimations()
  local Data = DataMgr.SpecialSwatch[Content.ColorId]
  if Data then
    self.Bg:SetBrushResourceObject(LoadObject(Data.MaterialPath))
  else
    self.Bg:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/Btn_Mosaic.Btn_Mosaic"))
  end
  self.Img_CheckFrame:SetRenderOpacity(0)
  self:SetIsSelected(self.Content.IsSelected, 1000)
  if self.Content.IsClicked then
    self:PlayAnimation(self.Click, 0, 1, 0, 1000)
  end
  if not self.Content.IsSelected and not self.Content.IsClicked then
    self:PlayAnimation(self.Normal, 0, 1, 0, 1000)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:SetIsSelected(IsSelected, Speed)
  if IsSelected then
    self:StopAnimation(self.Normal)
    self:FlushAnimations()
    self:PlayAnimation(self.Select, 0, 1, 0, Speed or 1)
  else
    self:StopAnimation(self.Select)
    self:FlushAnimations()
    self.Img_CheckBG:SetRenderOpacity(0)
    self.Img_Check:SetRenderOpacity(0)
    self.VX_White:SetRenderOpacity(0)
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
      self.VX_Hover:SetRenderOpacity(0)
    else
      self:PlayAnimation(self.Normal, 0, 1, 0)
    end
  end
end

function M:OnPressed()
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimation(self.Press)
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
  self:StopAnimation(self.Click)
  self:FlushAnimations()
  if self.Content.IsSelected then
    self.Img_CheckFrame:SetRenderOpacity(0)
    self.VX_Hover:SetRenderOpacity(0)
  else
    self:PlayAnimation(self.Normal, 0, 1, 0)
  end
end

function M:OnHovered()
  if self.Content.Event_OnHovered then
    self.Content.Event_OnHovered(self.Content.Owner, self.Content)
  end
  if self.Content.IsClicked then
    return
  end
  self:StopAnimation(self.Unhover)
  self:FlushAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnUnhovered()
  if self.Content.Event_OnUnhovered then
    self.Content.Event_OnUnhovered(self.Content.Owner, self.Content)
  end
  if self.Content.IsClicked then
    return
  end
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Hover)
  self:FlushAnimations()
  self:PlayAnimation(self.Unhover)
  self.VX_Press:SetRenderOpacity(0)
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
