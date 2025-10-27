local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_ZhiliuEvent = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")

function ReddotTreeNode_ZhiliuEvent:_Judge(EventId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local CurProgress = 0
  for i = 1, 7 do
    local Info = Avatar.ZhiLiuEntrustDict[i]
    if Info and Info.SubmitEntrustCompleted and Info.CombatEntrustCompleted then
      CurProgress = i
    else
      break
    end
  end
  local IsAllCompleted = 7 == CurProgress
  local IsPlayerGotReward = Avatar.ZhiLiuEntrustGrandRewardGot or false
  return IsAllCompleted and not IsPlayerGotReward
end

return ReddotTreeNode_ZhiliuEvent
