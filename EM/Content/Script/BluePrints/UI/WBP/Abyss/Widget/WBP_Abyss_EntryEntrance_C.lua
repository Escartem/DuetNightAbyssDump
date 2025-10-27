local WBP_Abyss_EntryEntrance = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Abyss_EntryEntrance:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  self.Text_Name:SetText(GText("Abyss_Buff"))
end

function WBP_Abyss_EntryEntrance:OnBtnClicked()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function WBP_Abyss_EntryEntrance:OnBtnHovered()
  self.IsHovering = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_EntryEntrance:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Abyss_EntryEntrance:OnBtnPressed()
  self.IsPressing = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_EntryEntrance:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Press)
  else
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

return WBP_Abyss_EntryEntrance
