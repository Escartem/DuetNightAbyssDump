require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
end

function M:OnBtnHovered()
  self.bHover = true
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Hover)
  local EventSoundPath = "event:/ui/roguelike/btn_black_hover"
  AudioManager(self):PlayUISound(self, EventSoundPath, nil, nil)
end

function M:OnBtnUnhovered()
  self.bHover = false
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.UnHover)
end

function M:OnBtnPressed()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
end

function M:OnBtnReleased()
  if self.bHover then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  end
end

return M
