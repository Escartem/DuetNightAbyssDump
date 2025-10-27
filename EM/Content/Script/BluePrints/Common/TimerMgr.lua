local Component = {}

function Component:Timer_Init()
  if rawget(self, "TimerHandles") == nil then
    rawset(self, "TimerHandles", {})
    rawset(self, "TimerHandleDatas", {})
    rawset(self, "TimerKeyIdx", 0)
  end
end

function Component:AddTimer(interval, func, isloop, delay, Key, IsRealTime, ...)
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
  
  local Source = self:GetTimerSource(IsRealTime) or UE4.UKismetSystemLibrary
  local Timer = Source.K2_SetTimerDelegate({self, f}, interval, isloop, delay)
  self.TimerHandles[Key] = Timer
  self.TimerHandleDatas[Timer] = {
    Key = Key,
    IsRealTime = IsRealTime,
    Func = f
  }
  return Timer, Key
end

function Component:_GetTimerInfo(Key)
  if not Key or not rawget(self, "TimerHandles") then
    return nil, nil, nil
  end
  local Timer, TimerInfo = self.TimerHandles[Key]
  if nil ~= Timer then
    TimerInfo = self.TimerHandleDatas[Timer]
  elseif type(Key) == "userdata" then
    Timer = Key
    TimerInfo = self.TimerHandleDatas[Key]
    if not TimerInfo then
      return
    end
    Key = TimerInfo.Key
  else
    return nil, nil, nil
  end
  return Key, Timer, TimerInfo
end

function Component:RemoveTimer(KeyOrTimer, bNotCallRemoveHandler)
  if nil == KeyOrTimer or not rawget(self, "TimerHandles") then
    return
  end
  local TimerInfo
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return
  end
  local IsRealTime = TimerInfo.IsRealTime
  local IsCombatTime = TimerInfo.IsCombatTime
  if IsCombatTime then
    self:ClearTimer_Combat(Timer)
  else
    local Source = self:GetTimerSource(IsRealTime) or UE4.UKismetSystemLibrary
    Source.K2_ClearAndInvalidateTimerHandle(self, Timer)
  end
  if not bNotCallRemoveHandler then
    self:RemoveTimerHandler(TimerInfo.Func)
  end
  self.TimerHandles[Key] = nil
  self.TimerHandleDatas[Timer] = nil
end

function Component:PauseTimer(KeyOrTimer)
  if nil == KeyOrTimer then
    return
  end
  self:Timer_Init()
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return
  end
  local IsRealTime = TimerInfo.IsRealTime
  local IsCombatTime = TimerInfo.IsCombatTime
  if IsCombatTime then
    self:PauseTimer_Combat(Timer)
  else
    local Source = self:GetTimerSource(IsRealTime) or UE4.UKismetSystemLibrary
    Source.K2_PauseTimerHandle(self, Timer)
  end
end

function Component:UnPauseTimer(KeyOrTimer)
  if nil == KeyOrTimer then
    return
  end
  self:Timer_Init()
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return
  end
  local IsRealTime = TimerInfo.IsRealTime
  local IsCombatTime = TimerInfo.IsCombatTime
  if IsCombatTime then
    self:UnPauseTimer_Combat(Timer)
  else
    local Source = self:GetTimerSource(IsRealTime) or UE4.UKismetSystemLibrary
    Source.K2_UnPauseTimerHandle(self, Timer)
  end
end

function Component:IsExistTimer(Key)
  if nil == Key then
    return false
  end
  return rawget(self, "TimerHandles") and nil ~= self.TimerHandles[Key]
end

function Component:CleanTimer()
  if rawget(self, "TimerHandles") == nil then
    return
  end
  for Key, Value in pairs(self.TimerHandles) do
    self:RemoveTimer(Key)
  end
  self.TimerHandles = {}
  self.TimerHandleDatas = {}
end

function Component:GetTimerRemainingTime(KeyOrTimer)
  if not KeyOrTimer then
    return -1
  end
  self:Timer_Init()
  local Key, Timer, TimerInfo = self:_GetTimerInfo(KeyOrTimer)
  if not Key then
    return -1
  end
  local IsRealTime = TimerInfo.IsRealTime
  local IsCombatTime = TimerInfo.IsCombatTime
  if IsCombatTime then
    return self:GetTimerRemainingTimeHandle_Combat(Timer)
  else
    local Source = self:GetTimerSource(IsRealTime) or UE4.UKismetSystemLibrary
    return Source.K2_GetTimerRemainingTimeHandle(self, Timer)
  end
end

function Component:GetTimerSource(IsRealTime)
  if IsRealTime then
    return URuntimeCommonFunctionLibrary
  else
    return UE4.UKismetSystemLibrary
  end
end

function Component:AddTimer_Combat(interval, func, isloop, delay, Key, ...)
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
  
  local Timer = self:SetTimerDelegate_Combat({self, f}, interval, isloop, delay, 0)
  self.TimerHandles[Key] = Timer
  self.TimerHandleDatas[Timer] = {
    Key = Key,
    IsCombatTime = true,
    Func = f
  }
  if isloop then
    self:RegisterLoopTimerHandler(f)
  end
  return Timer, Key
end

return Component
