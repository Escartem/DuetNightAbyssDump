require("UnLua")
local M = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.TalkPercent = self.UnitParams.TalkPercent or 50
  self.ChargeSpeedBase = self.UnitParams.ChargeSpeedBase or 1
  self.ChargeDis = self.UnitParams.ChargeDis or 1000
end

function M:ReceiveTick(DeltaSeconds)
  if self.InitSuccess then
    self:GetChargeSpeed()
  end
end

function M:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  M.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
  if self.BossBloodUI then
    self.BossBloodUI:UnLoadSelf()
    self.BossBloodUI = nil
  end
end

function M:ClientInitInfo(Info)
  M.Super.ClientInitInfo(self, Info)
  if self.Data.BloodUIParmas then
    local DoubleBossUI = UIManager(self):GetUIObj("DoubleBossBlood") or UIManager(self):LoadUINew("DoubleBossBlood")
    if DoubleBossUI then
      local BossType = UE4.EBossUIType.None
      if 1 == self.Data.BloodUIParmas.DoubleChargeLeft then
        self.BossBloodUI = DoubleBossUI.Boss_1
        BossType = UE4.EBossUIType.ChargeLeft
      elseif 1 == self.Data.BloodUIParmas.DoubleChargeRight then
        self.BossBloodUI = DoubleBossUI.Boss_2
        BossType = UE4.EBossUIType.ChargeRight
      end
      DoubleBossUI:ActiveBossUI()
      self.BossBloodUI:InitBossUI(self, false, BossType)
    end
  end
end

return M
