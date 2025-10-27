require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local SWITCH_STATE = {STATE_0 = 0, STATE_1 = 1}
local STATE_TO_ANIM = {
  [SWITCH_STATE.STATE_0] = "Normal_In",
  [SWITCH_STATE.STATE_1] = "Special_In"
}

function M:OnLoaded(OwnerPlayer, Params)
  DebugPrint("gmy@Battle_XibiSkill:OnLoaded OwnerPlayer, Params", OwnerPlayer, Params, Params.SpecialUI)
  self.OwnerPlayer = OwnerPlayer
  if not IsValid(OwnerPlayer) then
    return
  end
  self:SetProgressPercent(0)
  self.Num_Xibi:SetText("0")
  self.Root:SetVisibility(ESlateVisibility.Collapsed)
  self.Root:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local SwitchUI = Params.SpecialUI or 0
  self.WidgetSwitcher_State:SetActiveWidgetIndex(SwitchUI)
  self:PlayAnimation(self[STATE_TO_ANIM[SwitchUI]])
  self:AddTimer(0.2, self.UpdateProgress, true, 0)
end

function M:UpdateProgress()
  if IsValid(self.OwnerPlayer) then
    local CurrentEnergy = self.OwnerPlayer:GetAttr("SecondSp")
    local MaxEnergy = self.OwnerPlayer:GetAttr("MaxSecondSp")
    if MaxEnergy > 0 then
      local Percent = CurrentEnergy / MaxEnergy
      self:SetProgressPercent(Percent)
      local NumText = string.format("%.0f", CurrentEnergy)
      self.Num_Xibi:SetText(NumText)
    end
  end
end

function M:SetProgressPercent(Percent)
  self.Process_Xibi_Glow:SetPercent(Percent)
  self.Process_Xibi_Normal:SetPercent(Percent)
  self.Process_Xibi_Special:SetPercent(Percent)
  self.Process_Xibi_Glow2:SetPercent(Percent)
end

function M:SwitchUI(bSwitchUI)
  if bSwitchUI then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(SWITCH_STATE.STATE_1)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(SWITCH_STATE.STATE_0)
  end
end

return M
