local Heap = require("BluePrints.Client.Wrapper.Heap")
local Handle = {}

function Handle:New(Callback, EndTime, FuncName)
  local Obj = {}
  self.__index = self
  setmetatable(Obj, self)
  Obj:Init(Callback, EndTime, FuncName)
  return Obj
end

function Handle:Init(Callback, EndTime, FuncName)
  self.Callback = Callback
  self.EndTime = EndTime
  self.FuncName = FuncName
  self.SortValue = self.EndTime
end

function Handle:Cancel()
  self.Callback = nil
end

function Handle:Call()
  if self.Callback then
    pcall(self.Callback)
  end
  self.Callback = nil
end

local CallbackManager = {}

function CallbackManager:New(Tag)
  local Obj = {}
  self.__index = self
  setmetatable(Obj, self)
  Obj:Init(Tag)
  return Obj
end

function CallbackManager:Init(Tag)
  self.Handles = {}
  self.LastCallbackTime = 0
  self.CurrentTimer = nil
  self.Tag = Tag
  self.TickCallback = CommonUtils.Bind(self, self.Tick)
  self.HandlePool = {}
end

function CallbackManager:AddToHandlePool(Handle)
  self.HandlePool[#self.HandlePool + 1] = Handle
end

function CallbackManager:AddCallback(Time, Callback, FuncName)
  if not Time or not Callback then
    return
  end
  assert(Time >= 0, string.format("add callback failed for time: %s is less than 0", Time))
  FuncName = FuncName or " "
  local Now = skynet.now()
  local EndTime = Now + math.ceil(Time * 100)
  local _Handle = table.remove(self.HandlePool)
  if _Handle then
    _Handle:Init(Callback, EndTime, FuncName)
  else
    _Handle = Handle:New(Callback, EndTime, FuncName)
  end
  Heap.HeapPush(self.Handles, _Handle)
  self:UpdateTick(Now)
  return _Handle
end

function CallbackManager:CancelCallback(_Handle)
  if _Handle then
    _Handle:Cancel()
  end
end

function CallbackManager:UpdateTick(Now)
  if not self.Handles or next(self.Handles) == nil then
    return
  end
  local FirstEndTime = self.Handles[1].EndTime
  if FirstEndTime < self.LastCallbackTime or 0 == self.LastCallbackTime then
    self.LastCallbackTime = FirstEndTime
    self:CancelCurrentTimer()
    local RemainTime = math.max(FirstEndTime - Now, 0)
    if self.Tag == "Client" then
    elseif self.Tag == "Server" then
      _, self.CurrentTimer = skynet.timeout(math.ceil(RemainTime), self.TickCallback)
    end
  end
end

function CallbackManager:Tick()
  local Now = skynet.now()
  while self.Handles and #self.Handles > 0 and Now >= self.Handles[1].EndTime do
    local _Handle = Heap.HeapPop(self.Handles)
    _Handle:Call()
    self:AddToHandlePool(_Handle)
  end
  self.LastCallbackTime = 0
  self.CurrentTimer = nil
  self:UpdateTick(Now)
end

function CallbackManager:CancelCurrentTimer()
  if not self.CurrentTimer then
    return
  end
  if self.Tag == "Client" then
    URuntimeCommonFunctionLibrary.K2_ClearAndInvalidateTimerHandle(GWorld.GameInstance, self.CurrentTimer)
  elseif self.Tag == "Server" then
    skynet.remove_timeout(self.CurrentTimer)
  end
  self.CurrentTimer = nil
end

function CallbackManager:Release()
  self.Handles = {}
  self:CancelCurrentTimer()
  self.LastCallbackTime = 0
end

return CallbackManager
