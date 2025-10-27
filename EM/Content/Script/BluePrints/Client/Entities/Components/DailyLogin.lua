local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityController = require("BluePrints.UI.WBP.Activity.ActivityController")
local Component = {}

function Component:EnterWorld()
  ActivityController:Init()
end

function Component:LeaveWorld()
  ActivityController:Destory()
end

function Component:DailyLoginGetReward(ActivityID, Index)
  self.logger.info("DailyLoginGetReward", ActivityID, Index)
  
  local function Cb(ErrCode)
    if ErrorCode:Check(ErrCode, UIConst.Tip_CommonToast) then
      ActivityUtils.TrySubActivityReddotCommon("Red", ActivityID)
      EventManager:FireEvent(EventID.OnUpdateActivityEvent, "SignGetReward", ActivityID, Index)
      local RewardIds = DataMgr.DailyLogin[ActivityID].EventReward
      if nil ~= RewardIds and nil ~= RewardIds[Index] then
        local AllRewards = RewardUtils:GetRewards(RewardIds[Index], nil)
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, AllRewards, false, nil, self, false)
      end
    end
    DebugPrint("DailyLoginGetReward", ErrorCode:Name(ErrCode))
  end
  
  self:CallServer("DailyLoginGetReward", Cb, ActivityID, Index)
end

function Component:GMResetDailyLoginTime(EventID)
  self.logger.info("GMResetDailyLoginTime", EventID)
  self:CallServer("GMResetDailyLoginTime", EventID)
end

function Component:FlushActivity(ActivityTimeOpen)
  self.ActivityTimeOpen = ActivityTimeOpen
end

function Component:OnActivityTimeOpen(ActivityID)
  self.ActivityTimeOpen[ActivityID] = true
  EventManager:FireEvent(EventID.OnActivityTimeOpen, ActivityID)
end

function Component:OnActivityTimeOpenClose(ActivityID)
  self.ActivityTimeOpen[ActivityID] = nil
  EventManager:FireEvent(EventID.OnActivityTimeOpenClose, ActivityID)
end

function Component:OnActivityComplete(EventId)
  EventManager:FireEvent(EventID.OnActivityComplete, EventId)
end

return Component
