local DialogueWaitQueue_C = {}

function DialogueWaitQueue_C.New(QueueFinished_Obj, QueueFinished_Func, ...)
  local Obj = {}
  setmetatable(Obj, {__index = DialogueWaitQueue_C})
  Obj.QueueFinished_Callback = {
    QueueFinished_Obj,
    QueueFinished_Func,
    table.pack(...)
  }
  Obj.Queue = {}
  Obj.QueueItemCount = 0
  Obj.CompleteCount = 0
  Obj.bClosed = false
  return Obj
end

function DialogueWaitQueue_C:ResetWaitQueue()
  self.Queue = {}
  self.QueueItemCount = 0
  self.CompleteCount = 0
end

function DialogueWaitQueue_C:RegiserWaitItem(UniqueTag)
  DebugPrint("RegisterWaitItem", UniqueTag)
  self.Queue[UniqueTag] = false
  self.QueueItemCount = self.QueueItemCount + 1
end

function DialogueWaitQueue_C:CompleteWaitItem(UniqueTag)
  DebugPrint("CompleteWaitItem", UniqueTag)
  if self.bClosed then
    return
  end
  if self.Queue[UniqueTag] == false then
    self.Queue[UniqueTag] = true
    self.CompleteCount = self.CompleteCount + 1
  end
  if self.CompleteCount == self.QueueItemCount then
    local QueueFinished_Obj, QueueFinished_Func, QueueFinished_Params = table.unpack(self.QueueFinished_Callback)
    QueueFinished_Func(QueueFinished_Obj, table.unpack(QueueFinished_Params))
  end
end

function DialogueWaitQueue_C:CloseWaitQueue()
  self.bClosed = true
end

return DialogueWaitQueue_C
