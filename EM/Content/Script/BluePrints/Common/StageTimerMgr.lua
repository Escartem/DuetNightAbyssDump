require("UnLua")
local M = Class("BluePrints.Common.TimerMgr")

function M:AddTimer(interval, func, isloop, delay, Key, IsRealTime, TickGroup, ...)
  if nil == self then
    return
  end
  if nil == func then
    return
  end
  local Params = {
    ...
  }
  if nil == interval or interval <= 0 then
    func(self, ...)
    return
  end
  self:Timer_Init()
  if nil == Key then
    self.TimerKeyIdx = self.TimerKeyIdx + 1
    Key = "AutoMade_" .. self.TimerKeyIdx
  end
  self:RemoveTimer(Key)
  
  local function f(self)
    if not self then
      return
    end
    if not isloop then
      self:RemoveTimer(Key, true)
    end
    func(self, table.unpack(Params))
  end
  
  local Timer = ULastDemotableTimerSubsystem.K2_SetTimerDelegate({self, f}, interval, isloop, IsRealTime, delay, 0, TickGroup)
  self.TimerHandles[Key] = Timer
  self.TimerHandleDatas[Timer] = {
    Key = Key,
    IsRealTime = IsRealTime,
    Func = f,
    bTickEvenPaused = IsRealTime,
    TickGroup = TickGroup
  }
  return Timer, Key
end

function M:RemoveTimer(KeyOrTimer, bNotCallRemoveHandler)
  if nil == KeyOrTimer or not rawget(self, "TimerHandles") then
    return
  end
  local TimerInfo
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return
  end
  ULastDemotableTimerSubsystem.K2_ClearAndInvalidateTimerHandle(self, Timer, TimerInfo.TickGroup, TimerInfo.bTickEvenPaused)
  if not bNotCallRemoveHandler then
    self:RemoveTimerHandler(TimerInfo.Func)
  end
  self.TimerHandles[Key] = nil
  self.TimerHandleDatas[Timer] = nil
end

function M:PauseTimer(KeyOrTimer)
  if nil == KeyOrTimer then
    return
  end
  self:Timer_Init()
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return
  end
  local IsRealTime = TimerInfo.IsRealTime
  ULastDemotableTimerSubsystem.K2_PauseTimerHandle(self, Timer, TimerInfo.TickGroup, IsRealTime)
end

function M:GetTimerRemainingTime(KeyOrTimer)
  if not KeyOrTimer then
    return -1
  end
  self:Timer_Init()
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return -1
  end
  local IsRealTime = TimerInfo.IsRealTime
  return ULastDemotableTimerSubsystem.K2_GetTimerRemainingTimeHandle(self, Timer, TimerInfo.TickGroup, IsRealTime)
end

function M:UnPauseTimer(KeyOrTimer)
  if nil == KeyOrTimer then
    return
  end
  self:Timer_Init()
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return
  end
  local IsRealTime = TimerInfo.IsRealTime
  ULastDemotableTimerSubsystem.K2_UnPauseTimerHandle(self, Timer, TimerInfo.TickGroup, IsRealTime)
end

return M
