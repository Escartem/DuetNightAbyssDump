require("UnLua")
require("Const")
local RewardComponent = {}

function RewardComponent:TriggerRewardWithTransform(RewardId, Transform, MonsterEid)
  local RewardData = DataMgr.Reward[RewardId]
  if not RewardData or not RewardData.IsCombatResource then
    return
  end
  local Rewards = {RewardId}
  self:AddCacheBattleReward(Rewards, CommonConst.RewardReason.MonsterAnim, Transform)
end

return RewardComponent
