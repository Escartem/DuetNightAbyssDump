local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local ReddotTreeNode_DailySignIn = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")

function ReddotTreeNode_DailySignIn:_Judge(ActivityID)
  local PlayerAvatar = GWorld:GetAvatar()
  local AllSignServerData = PlayerAvatar.DailyLogin
  if not self:CheckActivityIsValid() then
    return false
  end
  for k, SignInfo in pairs(AllSignServerData) do
    if ActivityID == SignInfo:GetEventID() then
      local DailyLoginConfigData = DataMgr.DailyLogin[ActivityID]
      for idx = 1, DailyLoginConfigData.LoginDuration do
        local CurSignRewardState = ActivityUtils.GetCurSignRewardState(idx, SignInfo)
        if CurSignRewardState == ActivityUtils.EnumPlayerSignRewardState.SignedNotRecv then
          return true
        end
      end
      break
    end
  end
  return false
end

function ReddotTreeNode_DailySignIn:CheckActivityIsValid()
  local CacheDetail = self.Cache.Detail
  if CacheDetail.bClose then
    return false
  end
  return true
end

return ReddotTreeNode_DailySignIn
