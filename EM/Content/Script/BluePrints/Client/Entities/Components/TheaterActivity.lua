local Component = {}

function Component:TheaterGetTaskReward(TaskId, InCallback)
  self.logger.info("TheaterGetTaskReward", TaskId)
  
  local function Cb(ErrCode, Ret)
    DebugPrint("TheaterGetTaskReward", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("TheaterGetTaskReward", Cb, TaskId)
end

function Component:TheaterDonate(StepId, DonateList, InCallback)
  self.logger.info("TheaterDonate", StepId, DonateList)
  
  local function Cb(ErrCode, Ret)
    DebugPrint("TheaterDonate", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("TheaterDonate", Cb, StepId, DonateList)
end

function Component:TheaterJoinPerformGame(InCallback)
  self.logger.info("TheaterJoinPerformGame")
  
  local function Cb(ErrCode, Ret)
    DebugPrint("TheaterJoinPerformGame", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("TheaterJoinPerformGame", Cb)
end

function Component:TheaterPerform(PerformId, InCallback)
  self.logger.info("TheaterPerform", PerformId)
  
  local function Cb(ErrCode, Ret)
    DebugPrint("TheaterPerform", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("TheaterPerform", Cb, PerformId)
end

function Component:TheaterPerformGame_Start(EventId)
  self.logger.info("TheaterPerformGame_Start", EventId)
end

return Component
