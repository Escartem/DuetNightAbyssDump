local WBP_Rouge_FilterSortItem_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_FilterSortItem_C:Construct()
  self.BtnArea.OnClicked:Add(self, self.OnBtnClicked)
  self.BtnArea.OnHovered:Add(self, self.OnBtnHovered)
  self.BtnArea.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.BtnArea.OnPressed:Add(self, self.OnBtnPressed)
  self.BtnArea.OnReleased:Add(self, self.OnBtnReleased)
  self.Hover_In = self.Hover
  self.Hover_Out = self.Unhover
end

function WBP_Rouge_FilterSortItem_C:OnListItemObjectSet(Obj)
  self.Obj = Obj
  self.Obj.Entry = self
  self.Text_On:SetText(GText(Obj.Text))
  self.Text_Num:SetText(GText(Obj.Owner.RomanNum[Obj.Index]))
  self.Text_Level:SetText(GText("UI_Player_Level") .. Obj.Owner.DifficultyLevel[Obj.Index])
  self.UnLock = false
  if self.Obj.Owner.UnLockedDifficulty[self.Obj.Index] then
    self.UnLock = true
  end
  self:OnEntrySelectionChanged()
end

function WBP_Rouge_FilterSortItem_C:OnEntrySelectionChanged()
  if not self.UnLock then
    self:PlayAnimation(self.Forbidden)
  elseif self.Obj.IsSelected then
    self:PlayAnimation(self.Select)
  else
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Rouge_FilterSortItem_C:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/difficulty_select", nil, nil)
  if self.UnLock then
    if not self.Obj.IsSelected then
      self:PlayAnimation(self.Click)
    end
    self.Obj.Owner:OnListItemClicked(self.Obj)
  end
end

function WBP_Rouge_FilterSortItem_C:OnBtnHovered()
  if self.UnLock then
    self:OnEntryHoveredChanged(true)
  end
end

function WBP_Rouge_FilterSortItem_C:OnBtnUnhovered()
  if self.UnLock then
    self:OnEntryHoveredChanged(false)
  end
end

function WBP_Rouge_FilterSortItem_C:OnBtnPressed()
  if self.Obj.IsSelected then
    return
  end
  if not self.UnLock then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Rouge_FilterSortItem_C:OnBtnReleased()
end

function WBP_Rouge_FilterSortItem_C:OnEntryHoveredChanged(IsHovered)
  if IsHovered then
    self.IsMouseOut = false
    self:StopAnimation(self.Hover_Out)
    self:PlayAnimation(self.Hover_In)
  else
    if self.IsMouseOut then
      return
    end
    self:StopAnimation(self.Hover_In)
    self:PlayAnimation(self.Hover_Out)
  end
end

function WBP_Rouge_FilterSortItem_C:Destruct()
  self.BtnArea.OnClicked:Remove(self, self.OnBtnClicked)
  self.BtnArea.OnHovered:Remove(self, self.OnBtnHovered)
  self.BtnArea.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.BtnArea.OnPressed:Remove(self, self.OnBtnPressed)
  self.BtnArea.OnReleased:Remove(self, self.OnBtnReleased)
end

function WBP_Rouge_FilterSortItem_C:OnAnimationFinished(InAnim)
  if InAnim == self.Click and not self.Obj.IsSelected then
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Rouge_FilterSortItem_C:GetInAnimTime()
  return 0
end

function WBP_Rouge_FilterSortItem_C:GetOutAnimTime()
  return 0
end

function WBP_Rouge_FilterSortItem_C:PlayInAnim()
  self:OnEntrySelectionChanged()
end

function WBP_Rouge_FilterSortItem_C:PlayOutAnim()
end

return WBP_Rouge_FilterSortItem_C
