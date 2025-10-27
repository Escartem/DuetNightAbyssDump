require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
local Unhandled = UE4.UWidgetBlueprintLibrary.Unhandled()

function M:Construct()
  self.Btn.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn.OnClicked:Add(self, self.OnBtnClick)
  self.Btn.OnReleased:Add(self, self.OnBtnReleased)
end

function M:Destruct()
  self.Btn.OnHovered:Remove(self, self.OnBtnHovered)
  self.Btn.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.Btn.OnPressed:Remove(self, self.OnBtnPressed)
  self.Btn.OnClicked:Remove(self, self.OnBtnClick)
  self.Btn.OnReleased:Remove(self, self.OnBtnReleased)
end

function M:OnBtnHovered()
  self:OnEntryHoveredChanged(true)
end

function M:OnBtnUnhovered()
  self:OnEntryHoveredChanged(false)
end

function M:OnBtnReleased()
  self:StopAllAnimations()
  if not self.Obj.IsSelected then
    self:PlayAnimation(self.Normal)
  end
end

function M:OnBtnClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  self.Obj.IsSelected = true
  self:PlayAnimation(self.Click)
  self.Obj.Owner:OnListItemClicked(self.Obj)
end

function M:OnBtnPressed()
  if self.Obj.IsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnListItemObjectSet(Obj)
  self.Obj = Obj
  self.Obj.Entry = self
  local PolarityText = ModController:GetModel():GetPolarityText(Obj.Polarity)
  self.Text_Polarity:SetText(PolarityText)
  if self.Obj.IsSelected then
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:OnEntryHoveredChanged(IsHovered)
  if self.Obj.IsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(IsHovered and self.Hover or self.Normal)
end

function M:DeSelect()
  self.Obj.IsSelected = false
  self:PlayAnimation(self.Normal)
end

function M:PlayInAnim()
end

function M:PlayOutAnim()
end

function M:GetOutAnimTime()
  return 0
end

function M:GetInAnimTime()
  return 0
end

return M
