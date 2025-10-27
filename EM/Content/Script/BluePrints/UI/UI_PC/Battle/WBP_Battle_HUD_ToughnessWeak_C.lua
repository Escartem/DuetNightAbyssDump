require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Text_Weak:SetText(GText("UI_BossPenalize_Enter"))
end

function M:OnLoaded(BossMonster)
  self.BossMonster = BossMonster
  self:PlayAnimation(self.In)
  self.BossMonster:SetTimeDilation(Const.ToughnessTimeDilation, true)
  self:AddTimer(Const.ToughnessShowBloodTip, self.ShowBossBloodPanelTip)
  self:AddTimer(Const.ToughnessClose, self.PlayOutAnim)
end

function M:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function M:ShowBossBloodPanelTip()
  if not self.BossMonster or self.BossMonster:GetAttr("Hp") <= 0 then
    return
  end
  local BossBloodUI = self.BossMonster.BossBloodUI
  if not BossBloodUI then
    return
  end
  BossBloodUI:ShowPanelTip()
  AudioManager(self):PlayUISound(self, "event:/ui/common/boss_shield_bar_break", nil, nil)
end

function M:Close()
  if not self.BossMonster then
    return
  end
  local BossBloodUI = self.BossMonster.BossBloodUI
  if BossBloodUI and self.BossMonster:GetAttr("Hp") > 0 then
    BossBloodUI:UpdateTakeDownTipText()
  end
  self.BossMonster:SetTimeDilation(1, true)
  self.Super.Close(self)
end

return M
