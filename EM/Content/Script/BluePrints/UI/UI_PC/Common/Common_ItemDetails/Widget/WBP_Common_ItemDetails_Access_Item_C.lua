local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
end

function M:OnBtnHovered()
  if self.IsText then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.IsText then
    return
  end
  self:PlayAnimation(self.UnHover)
end

function M:OnBtnPressed()
  self.StartPressTime = os.clock()
  if self.IsText then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  if self.IsText then
    if self.JumpFunc then
      self.JumpFunc()
    end
    return
  end
  self.PressedTime = os.clock() - (self.StartPressTime or os.clock())
  if self.PressedTime < 0.2 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/tip_show_click", nil, nil)
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Click then
    if self.JumpFunc then
      if self.IsUnLock and self.Parent and self.Parent.ParentWidget and self.Parent.ParentWidget.Parent then
        self.Parent.ParentWidget.Parent:Close()
      end
      self.JumpFunc()
    end
  elseif InAnimation == self.UnHover then
    self:PlayAnimation(self.Normal)
  end
end

return M
