local Component = {}
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")

function Component:RpcZhiLiuEntrustSubmitResource(Key, ResouceIds, CallBack)
  local function Cb(ErrCode, RewardBox)
    self.logger.debug("ZhiLiuEntrustSubmitResource Cb", ErrCode, RewardBox)
    
    if CallBack then
      CallBack(ErrCode, RewardBox)
    end
  end
  
  self:CallServer("RpcZhiLiuEntrustSubmitResource", Cb, Key, ResouceIds)
end

function Component:RpcZhiLiuEntrustGrandRewards(CallBack)
  local function Cb(ErrCode, RewardBox)
    self.logger.debug("ZhiLiuEntrustGrandRewards Cb", ErrCode, RewardBox)
    
    if ErrorCode:Check(ErrCode) then
      local ZhiliuEventId = DataMgr.EventConstant.ZhiLiuEntrustEventID.ConstantValue
      ActivityUtils.TrySubActivityReddotCommon("Red", ZhiliuEventId)
    end
    if CallBack then
      CallBack(ErrCode, RewardBox)
    end
  end
  
  self:CallServer("RpcZhiLiuEntrustGrandRewards", Cb)
end

return Component
