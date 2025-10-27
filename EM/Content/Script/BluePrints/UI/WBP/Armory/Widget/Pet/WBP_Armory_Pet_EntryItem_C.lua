require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnBtnReleased)
  self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.BGRarityColor = {
    [5] = self.Gold_0,
    [4] = self.Purple_0,
    [3] = self.Blue_0,
    [0] = self.White_0
  }
  self.SelectRarityColor = {
    [5] = self.Gold_1,
    [4] = self.Purple_1,
    [3] = self.Blue_1,
    [0] = self.White_1
  }
  self:UnbindAllFromAnimationFinished(self.In)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInFinished
  })
end

function M:SetForbidden(bDisable)
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnHovered:Clear()
  self.Button_Area.OnUnhovered:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnReleased:Clear()
  self.Button_Area:SetForbidden(bDisable)
end

function M:Init(Content, bNot)
  self.Content = Content
  Content.Widget = self
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self._OnClicked = Content.OnClicked
  self.IsLocked = Content.IsLocked
  if Content.IsLocked then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(2)
  elseif Content.IsEmpty then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  local IconPath
  if Content.IconPath then
    IconPath = Content.IconPath
  elseif Content.EntryId then
    local Data = DataMgr.PetEntry[Content.EntryId]
    IconPath = Data and Data.Icon
  end
  if IconPath then
    self:SetIcon(IconPath)
  end
  self:SetIsSelected(Content.IsSelected)
  self:SetRarity(Content.Rarity)
  self:PlayInAnim()
end

function M:SetIcon(IconPath)
  if IconPath then
    self.Icon_Entry:SetBrushResourceObject(LoadObject(IconPath))
  end
end

function M:SetRarity(Rarity)
  Rarity = Rarity or 0
  self.VX_GlowBG:SetColorAndOpacity(self.BGRarityColor[Rarity])
  self.VX_Glow:SetColorAndOpacity(self.BGRarityColor[Rarity])
  self.VX_Glow01:SetColorAndOpacity(self.BGRarityColor[Rarity])
  self.VX_GlowSelect:SetColorAndOpacity(self.SelectRarityColor[Rarity])
end

function M:PlayInAnim()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function M:OnInFinished()
  if self.IsSelected then
    return
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:PlayOutAnim()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

function M:OnBtnClicked()
  if self._OnClicked then
    self._OnClicked(self.Owner, self.Content, self)
  end
  if not self.IsSelected then
    self:OnBtnHovered()
  end
end

function M:SetIsSelected(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:StopAnimation(self.Normal)
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.Click)
  else
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
  end
end

function M:SetSelected()
end

function M:OnBtnPressed()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if self.IsSelected then
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  else
    self:SetIsSelected(self.IsSelected)
  end
end

function M:OnBtnHovered()
  if self.IsSelected or self:IsAnimationPlaying(self.In) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.IsSelected or self:IsAnimationPlaying(self.In) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Button_Area)
end

return M
