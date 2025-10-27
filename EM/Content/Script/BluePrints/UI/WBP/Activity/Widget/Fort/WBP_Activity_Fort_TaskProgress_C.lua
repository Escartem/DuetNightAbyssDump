require("UnLua")
local RewardModel = require("BluePrints.UI.WBP.Activity.Widget.Fort.WBP_Activity_Fort_Reward_Model")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init()
  self:SetText(GText("Event_RewardTitle_103007"))
  self:BindEventOnClicked(self, self.OpenReward)
end

function M:Construct()
  self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnBtnReleased)
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
end

function M:SetText(Text)
  self.Text_RewardProgress:SetText(Text)
end

function M:BindEventOnClicked(Obj, Func, Params)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = Params
end

function M:OnBtnHovered()
  self.IsHovering = true
  if self.IsPressing then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnBtnPressed()
  self.IsPressing = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Normal)
  else
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Hover)
  end
end

function M:OnBtnClicked()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  if self.Obj and self.Func then
    if self.Params then
      self.Func(self.Obj, table.unpack(self.Params))
    else
      self.Func(self.Obj)
    end
  end
end

function M:OpenReward()
  RewardModel:OpenReward(self)
end

return M
