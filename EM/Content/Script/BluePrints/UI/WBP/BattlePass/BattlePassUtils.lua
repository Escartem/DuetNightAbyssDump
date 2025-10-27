local BattlePassUtils = {}

function BattlePassUtils:GetLevel()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    return Avatar.BattlePassLevel
  end
  return 0
end

function BattlePassUtils:GetMaxLevel()
  local Avatar = GWorld:GetAvatar()
  if Avatar and 0 ~= Avatar.BattlePassVersion then
    local BattlePassReward = self:GetBattlePassReward(Avatar.BattlePassVersion)
    return #(BattlePassReward or {})
  end
  return 0
end

function BattlePassUtils:IsMaxLevel()
  return self:GetLevel() >= self:GetMaxLevel()
end

function BattlePassUtils:GetBattlePassReward(BattlePassVersion)
  local BattlePassData = DataMgr.BattlePassMain[BattlePassVersion]
  if not BattlePassData then
    return nil
  end
  local BPRewardTemplateID = BattlePassData.BPRewardTemplateID
  if not BPRewardTemplateID then
    return nil
  end
  local BattlePassReward = DataMgr.BattlePassReward[BPRewardTemplateID]
  return BattlePassReward
end

return BattlePassUtils
