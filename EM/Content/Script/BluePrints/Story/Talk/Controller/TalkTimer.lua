local TalkTimer_C = {}

function TalkTimer_C.New(GroupTag, Manager, DelayTime, bLoop, LoopTime, Obj, Func, ...)
  local o = setmetatable({}, {__index = TalkTimer_C})
  o.GroupTag = GroupTag
  o.Timer = 0
  o.WaitTime = DelayTime or 0
  o.Manager = Manager
  o.bLoop = bLoop
  o.LoopTime = LoopTime
  o.bExecuted = false
  o.bPaused = false
  o.Callback = {
    Obj = Obj,
    Func = Func,
    Params = table.pack(...)
  }
  if o.WaitTime <= 0 then
    o:Execute()
  end
  return o
end

function TalkTimer_C:ReceiveTick(DeltaTime)
  if self.bPaused == true then
    return
  end
  self.Timer = self.Timer + DeltaTime
  if self.Timer > self.WaitTime then
    self:Execute()
  end
end

function TalkTimer_C:Execute()
  self.bExecuted = true
  local Func = self.Callback.Func
  local Obj = self.Callback.Obj
  local Params = self.Callback.Params
  if not self.bLoop then
    self.Manager:DestroyTimer(self.GroupTag, self)
  else
    self.WaitTime = self.LoopTime
    self.Timer = 0
  end
  Func(Obj, table.unpack(Params))
end

local TalkTimerManager_C = {}

function TalkTimerManager_C.New()
  local Obj = setmetatable({}, {__index = TalkTimerManager_C})
  Obj.TimerMap = {}
  Obj.DeleteTagMap = {}
  Obj.DeleteTimerMap = {}
  Obj.AddTimerList = {}
  return Obj
end

function TalkTimerManager_C:ReceiveTick(DeltaTime)
  if #self.AddTimerList > 0 then
    for _, AddTimerData in ipairs(self.AddTimerList) do
      local GroupTag = AddTimerData.GroupTag
      local TalkTimer = AddTimerData.Timer
      self.TimerMap[GroupTag] = self.TimerMap[GroupTag] or {}
      self.TimerMap[GroupTag][TalkTimer] = true
    end
    self.AddTimerList = {}
  end
  if #self.DeleteTagMap > 0 then
    for _, GroupTag in ipairs(self.DeleteTagMap) do
      self.TimerMap[GroupTag] = nil
    end
    self.DeleteTagMap = {}
  end
  if #self.DeleteTimerMap > 0 then
    for _, DeleteTimerData in ipairs(self.DeleteTimerMap) do
      if DeleteTimerData.GroupTag and DeleteTimerData.Timer then
        ;(self.TimerMap[DeleteTimerData.GroupTag] or {})[DeleteTimerData.Timer] = nil
      end
    end
    self.DeleteTimerMap = {}
  end
  for GroupTag, Timers in pairs(self.TimerMap) do
    for Timer, _ in pairs(Timers) do
      Timer:ReceiveTick(DeltaTime)
    end
  end
end

function TalkTimerManager_C:PauseTimer(GroupTag)
  DebugPrint("TalkTimerManager_C:PauseTimer", GroupTag)
  if not GroupTag then
    return
  end
  local Timers = self.TimerMap[GroupTag]
  if Timers then
    for Timer, bValid in pairs(Timers) do
      if bValid then
        Timer.bPaused = true
      end
    end
  end
  for _, TimerData in pairs(self.AddTimerList) do
    if TimerData.GroupTag == GroupTag then
      TimerData.Timer.bPaused = true
    end
  end
end

function TalkTimerManager_C:UnPauseTimer(GroupTag)
  DebugPrint("TalkTimerManager_C:UnPauseTimer", GroupTag)
  if not GroupTag then
    return
  end
  local Timers = self.TimerMap[GroupTag]
  if Timers then
    for Timer, bValid in pairs(Timers) do
      if bValid then
        Timer.bPaused = false
      end
    end
  end
  for _, TimerData in pairs(self.AddTimerList) do
    if TimerData.GroupTag == GroupTag then
      TimerData.Timer.bPaused = false
    end
  end
end

function TalkTimerManager_C:ClearTimer(GroupTag)
  if not GroupTag then
    return
  end
  self:TryClearTimesAddTimerList(GroupTag)
  self.TimerMap[GroupTag] = nil
end

function TalkTimerManager_C:DestroyTimer(GroupTag, Timer)
  if not GroupTag or not Timer then
    return
  end
  self:TryRemoveTimerInAddTimerList(Timer)
  if self.TimerMap[GroupTag] then
    self.TimerMap[GroupTag][Timer] = nil
  end
end

function TalkTimerManager_C:AddTimer(GroupTag, DelayTime, bLoop, LoopTime, Obj, Func, ...)
  local TalkTimer = TalkTimer_C.New(GroupTag, self, DelayTime, bLoop, LoopTime, Obj, Func, ...)
  if not TalkTimer.bExecuted then
    table.insert(self.AddTimerList, {GroupTag = GroupTag, Timer = TalkTimer})
  end
  return TalkTimer
end

function TalkTimerManager_C:TryRemoveTimerInAddTimerList(Timer)
  local NewAddTimerList = {}
  for Index, TimerData in pairs(self.AddTimerList) do
    if TimerData.Timer ~= Timer then
      table.insert(NewAddTimerList, TimerData)
    end
  end
  self.AddTimerList = NewAddTimerList
end

function TalkTimerManager_C:TryClearTimesAddTimerList(GroupTag)
  local NewAddTimerList = {}
  for Index, TimerData in pairs(self.AddTimerList) do
    if TimerData.GroupTag ~= GroupTag then
      table.insert(NewAddTimerList, TimerData)
    end
  end
  self.AddTimerList = NewAddTimerList
end

return {TalkTimerManager_C = TalkTimerManager_C, TalkTimer_C = TalkTimer_C}
