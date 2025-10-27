require("UnLua")
local Str = require("BluePrints.Common.DataStructure")
local Deque = Str.Deque
local CoroutineComponent = {}

function CoroutineComponent:Initialize(Initializer)
  self.IsNeedExecByTurn = nil
  self.OtherArgs = nil
  self.CoroutineTaskQueue = Deque:New()
  self.CoroutineTaskTable = {}
  self.CoroutineParamsTable = {}
  self.FunctionToThread = {}
  self.OnCompletedCallback = nil
end

function CoroutineComponent:InitCoroutine(IsNeedExecByTurn, ...)
  self.IsNeedExecByTurn = IsNeedExecByTurn
  self.OtherArgs = table.pack(...)
end

function CoroutineComponent:CleanCoroutine()
  self:StopCoroutine()
  self.OnCompletedCallback = nil
  self.CoroutineParamsTable = {}
  self.FunctionToThread = {}
end

function CoroutineComponent:AddCoroutineTask(FunctionObj, ...)
  local FunctionThread = coroutine.create(FunctionObj, ...)
  if self.IsNeedExecByTurn then
    self.CoroutineTaskQueue:PushBack(FunctionThread)
  else
    table.insert(self.CoroutineTaskTable, FunctionThread)
  end
  self.FunctionToThread[FunctionObj] = FunctionThread
  self.CoroutineParamsTable[FunctionThread] = {
    ...
  }
end

function CoroutineComponent:RemoveCoroutineTask(FunctionObj)
  local ToRemoveTask = self.FunctionToThread[FunctionObj]
  if nil ~= ToRemoveTask and coroutine.status(ToRemoveTask) ~= "dead" then
    coroutine.close(ToRemoveTask)
  end
end

function CoroutineComponent:AddCompletedCallback(CallbackFunction, FunctionObj, ...)
  self.OnCompletedCallback = {
    Func = CallbackFunction,
    Obj = FunctionObj,
    Param = table.pack(...)
  }
end

function CoroutineComponent:StartCoroutine()
  if self.IsNeedExecByTurn then
    if self.CoroutineTaskQueue:Size() <= 0 then
      if self.OnCompletedCallback ~= nil then
        self.OnCompletedCallback.Func(self.OnCompletedCallback.Obj, table.unpack(self.OnCompletedCallback.Param))
        self.OnCompletedCallback = nil
      end
      return true
    end
    local FunctionThread = self.CoroutineTaskQueue:Get(1)
    if coroutine.status(FunctionThread) == "suspended" then
      local Params = self.CoroutineParamsTable[FunctionThread] or {}
      local IsCanExec, Reason = coroutine.resume(FunctionThread, table.unpack(Params))
      if not IsCanExec then
        print(_G.LogTag, "StartCoroutine CoroutineTaskQueue error !!! Reason is ", Reason)
        return false
      end
    elseif coroutine.status(FunctionThread) == "dead" then
      self.CoroutineTaskQueue:PopFront()
    end
  else
    if #self.CoroutineTaskTable <= 0 then
      if self.OnCompletedCallback ~= nil then
        self.OnCompletedCallback.Func(self.OnCompletedCallback.Obj, table.unpack(self.OnCompletedCallback.Param))
        self.OnCompletedCallback = nil
      end
      return true
    end
    local NeeedDel = {}
    for i, v in ipairs(self.CoroutineTaskTable) do
      if coroutine.status(v) == "suspended" then
        local Params = self.CoroutineParamsTable[v] or {}
        local IsCanExec, Reason = coroutine.resume(v, table.unpack(Params))
        if not IsCanExec then
          print(_G.LogTag, "StartCoroutine CoroutineTaskTable error !!! Reason is ", Reason)
        end
      elseif coroutine.status(v) == "dead" then
        table.insert(NeeedDel, i)
      end
    end
    for i, v in ipairs(NeeedDel) do
      table.remove(self.CoroutineTaskTable, v)
    end
    return false
  end
end

function CoroutineComponent:StopCoroutine()
  if self.IsNeedExecByTurn then
    while self.CoroutineTaskQueue:Size() > 0 do
      local ToRemoveTask = self.CoroutineTaskQueue:PopBack()
      if coroutine.status(ToRemoveTask) == "suspended" then
        coroutine.close(ToRemoveTask)
      end
    end
  else
    for i, v in ipairs(self.CoroutineTaskTable) do
      if coroutine.status(v) == "suspended" then
        coroutine.close(v)
      end
    end
    self.CoroutineTaskTable = {}
  end
end

return CoroutineComponent
