local M = Class({
  "BluePrints.Item.CombatProp.BP_CombatPropBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:IsFushuItem()
  return true
end

function M:OnPlayerEnterCheckBuff(Player)
  if self.IsActive and Player and Player.IsPlayer and Player:IsPlayer() then
    if self.RemoveTag then
      Player:SetBool("Baiheng_Mijing_Dot", false)
    else
      Battle(Player):RemoveBuffFromTarget(Player, Player, self.BuffId, false, -1)
    end
  end
end

function M:OnPlayerLeaveCheckBuff(Player)
  if Player and Player.IsPlayer and Player:IsPlayer() then
    local State = self:CheckPlayerOverlap(Player)
    if 1 == State then
      Battle(Player):RemoveBuffFromTarget(Player, Player, self.BuffId, false, -1)
    elseif 2 == State then
      Battle(Player):AddBuffToTarget(Player, Player, self.BuffId, -1, 0, nil)
      Player:SetBool("Baiheng_Mijing_Dot", false)
    elseif 3 == State then
      Battle(Player):AddBuffToTarget(Player, Player, self.BuffId, -1, 0, nil)
      Player:SetBool("Baiheng_Mijing_Dot", true)
    end
  end
end

return M
