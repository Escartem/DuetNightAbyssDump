local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_JJGame = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")

function ReddotTreeNode_JJGame:_Judge(ActivityID)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local EventEndTime = DataMgr.EventMain[ActivityID].EventEndTime
  local RewardEndTime = DataMgr.EventMain[ActivityID].RewardEndTime
  if RewardEndTime < TimeUtils.NowTime() then
    return false
  end
  if EventEndTime < TimeUtils.NowTime() then
    if CommonUtils.Size(Avatar.MidTermScoresRewards) > 0 then
      return true
    else
      return false
    end
  end
  if CommonUtils.Size(Avatar.MidTermScoresRewards) > 0 then
    return true
  end
  for _, v in pairs(Avatar.MidTermAchvProgressRewarded) do
    if 0 == v then
      return true
    end
  end
  for TaskId, Task in pairs(Avatar.MidTermTasks) do
    if Avatar.MidTermTasksRecord[TaskId] and Avatar.MidTermTasksRecord[TaskId].FinishCount and Avatar.MidTermTasksRecord[TaskId].FinishCount > 0 then
      return true
    end
    if Task.Progress >= Task.Target and Task.RewardsGot == false then
      return true
    end
  end
  return false
end

return ReddotTreeNode_JJGame
