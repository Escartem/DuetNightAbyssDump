require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
  local IsEliteMode = self:GetCurrentTabState()
  self:UpdateSwitchVisual(IsEliteMode)
end

function M:OnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  local CurrentState = self:GetCurrentTabState()
  local NewState = not CurrentState
  self:UpdateSwitchVisual(NewState)
  self:SetCurrentTabState(NewState)
  EventManager:FireEvent(EventID.DoubleModSwitchTab, NewState)
end

function M:OnHovered()
  self:PlayAnimation(self.Hover)
end

function M:OnUnhovered()
  self:PlayAnimation(self.UnHover)
end

function M:UpdateSwitchVisual(IsElite)
  self:StopAllAnimations()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if IsElite then
    self:PlayAnimation(self.Switch)
    self.Text_TabTitleNormal:SetText(GText("UI_Event_ModDrop_Challenge"))
    if Avatar.DoubleModDropFirst then
      Avatar:SetDoubleModDropFirst()
      self:PlayAnimationReverse(self.Tips_In_Out)
    end
  else
    self:PlayAnimationReverse(self.Switch)
    self.Text_TabTitleNormal:SetText(GText("UI_Event_ModDrop_Normal"))
    if Avatar.DoubleModDropFirst then
      self.Text_Tips:SetText(GText("UI_Event_ModDrop_Bubble"))
      self:PlayAnimation(self.Tips_Loop, 0, 0)
    end
  end
end

function M:GetCurrentTabState()
  return EMCache:Get("Is_DoubleMod_SwitchTab", true)
end

function M:SetCurrentTabState(state)
  EMCache:Set("Is_DoubleMod_SwitchTab", state, true)
end

return M
