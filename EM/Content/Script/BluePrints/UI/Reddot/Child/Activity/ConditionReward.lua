local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_ConditionReward = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")

function ReddotTreeNode_ConditionReward:_Judge(ActivityID)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local ConditionData = DataMgr.ConditionalRewardEvent[ActivityID]
  if not ConditionData then
    return false
  end
  if not ConditionUtils.CheckCondition(Avatar, ConditionData.RewardClaimCondition) then
    return false
  end
  if Avatar.ClaimActivityConditionRewardRecord[ActivityID] then
    return false
  end
  return true
end

return ReddotTreeNode_ConditionReward
