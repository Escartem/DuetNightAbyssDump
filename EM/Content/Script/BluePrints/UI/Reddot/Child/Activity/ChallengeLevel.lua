local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_ChallengeLevel = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")

function ReddotTreeNode_ChallengeLevel:_Judge(activityId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local currentLevel = Avatar.Level
  local eventData = DataMgr.PlayerLvEvent[activityId]
  if not eventData then
    return false
  end
  for level, _ in pairs(eventData) do
    if level <= currentLevel and not Avatar.ActivityPlayerLvRewardsGot:HasElement(activityId, level) then
      return true
    end
  end
  return false
end

return ReddotTreeNode_ChallengeLevel
