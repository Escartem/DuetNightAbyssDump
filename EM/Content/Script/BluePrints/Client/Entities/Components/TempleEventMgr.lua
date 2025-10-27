local Component = {}

function Component:TempleGetReward(TempleRewardId)
  self.logger.info("TempleGetReward", TempleRewardId)
  
  local function Cb(ErrCode)
    DebugPrint("TempleGetReward", ErrorCode:Name(ErrCode))
  end
  
  self:CallServer("TempleGetReward", Cb, TempleRewardId)
end

function Component:TempleGetAllModeReward(EventId, IsHardMode)
  self.logger.info("TempleGetAllModeReward", EventId, IsHardMode)
  
  local function Cb(ErrCode)
    DebugPrint("TempleGetAllModeReward", ErrorCode:Name(ErrCode))
  end
  
  self:CallServer("TempleGetAllModeReward", Cb, EventId, IsHardMode)
end

return Component
