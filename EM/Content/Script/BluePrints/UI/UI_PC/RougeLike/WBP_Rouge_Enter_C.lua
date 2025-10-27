local WBP_Rouge_Enter_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_Enter_C:Construct()
  self:PlayAnimation(self.Normal)
  self.Btn_ForClick.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_ForClick.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_ForClick.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_ForClick.OnReleased:Add(self, self.OnBtnReleased)
  self.Btn_ForClick.OnClicked:Add(self, self.OnBtnClicked)
  self.IsHovering = false
  self.IsPressing = false
end

function WBP_Rouge_Enter_C:Init(Reddot)
  if Reddot then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_Enter_C:OnBtnHovered()
  self.IsHovering = true
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/func_hover", nil, nil)
  self:PlayAnimation(self.Normal)
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function WBP_Rouge_Enter_C:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_Enter_C:OnBtnPressed()
  self.IsPressing = true
  self:PlayAnimation(self.Normal)
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Rouge_Enter_C:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_Enter_C:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/func_click", nil, nil)
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function WBP_Rouge_Enter_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Unhover then
    self:PlayAnimation(self.Normal)
  end
end

return WBP_Rouge_Enter_C
