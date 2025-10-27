local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_TrialChar = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")

function ReddotTreeNode_TrialChar:_Judge(EventId)
  local PlayerAvatar = GWorld:GetAvatar()
  local TryOutServerData = PlayerAvatar.CharTrial[EventId]
  if TryOutServerData and not TryOutServerData:IsGetReward() and TryOutServerData:IsFinished() then
    return true
  end
  return false
end

return ReddotTreeNode_TrialChar
