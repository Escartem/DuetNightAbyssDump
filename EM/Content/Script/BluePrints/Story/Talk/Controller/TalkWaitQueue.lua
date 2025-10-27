local TalkWaitQueue_C = {}

function TalkWaitQueue_C.New(GroupTag, TalkWaitQueueManager, QueueFinished_Obj, QueueFinished_Func, ...)
  local Obj = {}
  setmetatable(Obj, {__index = TalkWaitQueue_C})
  Obj.GroupTag = GroupTag
  Obj.TalkWaitQueueManager = TalkWaitQueueManager
  Obj.QueueFinished_Callback = {
    QueueFinished_Obj,
    QueueFinished_Func,
    table.pack(...)
  }
  Obj.Queue = {}
  Obj.QueueItemCount = 0
  Obj.CompleteCount = 0
  Obj.bClosed = false
  Obj.bCompleted = false
  return Obj
end

function TalkWaitQueue_C:ResetWaitQueue()
  if not self.TalkWaitQueueManager:CheckWaitQueueValid(self.GroupTag, self) then
    return self
  end
  self.Queue = {}
  self.QueueItemCount = 0
  self.CompleteCount = 0
  self.bCompleted = false
  return self
end

function TalkWaitQueue_C:RegiserWaitItem(UniqueTag)
  if not self.TalkWaitQueueManager:CheckWaitQueueValid(self.GroupTag, self) then
    return self
  end
  DebugPrint("RegisterWaitItem", UniqueTag)
  self.Queue[UniqueTag] = false
  self.QueueItemCount = self.QueueItemCount + 1
  return self
end

function TalkWaitQueue_C:CompleteWaitItem(UniqueTag)
  DebugPrint("CompleteWaitItem", UniqueTag)
  if not self.TalkWaitQueueManager:CheckWaitQueueValid(self.GroupTag, self) then
    return self
  end
  if self.bClosed then
    return self
  end
  if self.Queue[UniqueTag] == false then
    self.Queue[UniqueTag] = true
    self.CompleteCount = self.CompleteCount + 1
  end
  self:TryCompleteWaitQueue()
  return self
end

function TalkWaitQueue_C:TryCompleteWaitQueue()
  if self.CompleteCount == self.QueueItemCount then
    if self.bCompleted then
      return self
    end
    self.bCompleted = true
    local QueueFinished_Obj, QueueFinished_Func, QueueFinished_Params = table.unpack(self.QueueFinished_Callback)
    if QueueFinished_Func then
      QueueFinished_Func(QueueFinished_Obj, table.unpack(QueueFinished_Params))
    end
  end
end

function TalkWaitQueue_C:IsTagOnlyUncompleted(UniqueTag)
  if self.Queue[UniqueTag] == true then
    return false
  end
  if 1 == self.QueueItemCount - self.CompleteCount then
    return true
  end
  return false
end

function TalkWaitQueue_C:CloseWaitQueue()
  if not self.TalkWaitQueueManager:CheckWaitQueueValid(self.GroupTag, self) then
    return self
  end
  self.bClosed = true
  return self
end

function TalkWaitQueue_C:AddWaitItemToWaitQueue(UniqueTag)
  if not self.TalkWaitQueueManager:CheckWaitQueueValid(self.GroupTag, self) then
    DebugPrint("TalkWaitQueue_C:AddWaitItemToWaitQueue: CheckWaitQueueValid fail")
    return
  end
  if self.Queue[UniqueTag] ~= nil then
    DebugPrint("TalkWaitQueue_C:AddWaitItemToWaitQueue: self.Queue[UniqueTag] already existed", UniqueTag)
    return
  end
  self.Queue[UniqueTag] = false
  self.QueueItemCount = self.QueueItemCount + 1
  if self.CompleteCount == self.QueueItemCount then
    local QueueFinished_Obj, QueueFinished_Func, QueueFinished_Params = table.unpack(self.QueueFinished_Callback)
    if QueueFinished_Func then
      QueueFinished_Func(QueueFinished_Obj, table.unpack(QueueFinished_Params))
    end
  end
end

function TalkWaitQueue_C:DeleteWaitItemInWaitQueue(UniqueTag)
  if not self.TalkWaitQueueManager:CheckWaitQueueValid(self.GroupTag, self) then
    DebugPrint("TalkWaitQueue_C:DeleteWaitItemInWaitQueue: CheckWaitQueueValid fail")
    return
  end
  if self.Queue[UniqueTag] == nil then
    DebugPrint("TalkWaitQueue_C:AddWaitItemToWaitQueue: self.Queue[UniqueTag] is unexisted", UniqueTag)
    return
  end
  if self.Queue[UniqueTag] == true then
    self.CompleteCount = self.CompleteCount - 1
  end
  self.Queue[UniqueTag] = nil
  self.QueueItemCount = self.QueueItemCount - 1
  if self.CompleteCount == self.QueueItemCount then
    local QueueFinished_Obj, QueueFinished_Func, QueueFinished_Params = table.unpack(self.QueueFinished_Callback)
    if QueueFinished_Func then
      QueueFinished_Func(QueueFinished_Obj, table.unpack(QueueFinished_Params))
    end
  end
end

local TalkWaitQueueManager_C = {}

function TalkWaitQueueManager_C.New()
  local Obj = setmetatable({}, {__index = TalkWaitQueueManager_C})
  Obj.WaitQueueMap = {}
  return Obj
end

function TalkWaitQueueManager_C:CreateWaitQueue(GroupTag, RegisterList, Obj, Func, ...)
  local WaitQueue = TalkWaitQueue_C.New(GroupTag, self, Obj, Func, ...)
  local WaitQueueMap = self.WaitQueueMap
  WaitQueueMap[GroupTag] = WaitQueueMap[GroupTag] or {}
  WaitQueueMap[GroupTag][WaitQueue] = true
  for _, RegisterInfo in ipairs(RegisterList) do
    if not RegisterInfo.Condition or RegisterInfo.Condition() then
      WaitQueue:RegiserWaitItem(RegisterInfo.Tag)
    end
  end
  return WaitQueue
end

function TalkWaitQueueManager_C:ClearGroup(GroupTag)
  self.WaitQueueMap[GroupTag] = nil
end

function TalkWaitQueueManager_C:CheckWaitQueueValid(GroupTag, WaitQueue)
  if self.WaitQueueMap[GroupTag] and self.WaitQueueMap[GroupTag][WaitQueue] then
    return true
  end
  return false
end

return {TalkWaitQueue_C = TalkWaitQueue_C, TalkWaitQueueManager_C = TalkWaitQueueManager_C}
