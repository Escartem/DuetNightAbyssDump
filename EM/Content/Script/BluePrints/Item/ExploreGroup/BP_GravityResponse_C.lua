local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.ActiveTime = self.UnitParams.ActiveTime
end

function M:OnBallEnter()
  if self.StateId ~= self.NormalStateId then
    return
  end
  self:OnActive()
  self:ChangeState("Manual", 0, self.ActiveStateId)
end

function M:OnBallLeave()
  if self.StateId ~= self.ActiveStateId then
    return
  end
  self:AddTimer(self.ActiveTime, self.OnActiveTimeEnd, false, 0, "OnActiveTimeEnd")
end

function M:OnActiveTimeEnd()
  if self.StateId ~= self.ActiveStateId then
    return
  end
  self:OnFail()
  self:ChangeState("Manual", 0, self.NormalStateId)
end

return M
