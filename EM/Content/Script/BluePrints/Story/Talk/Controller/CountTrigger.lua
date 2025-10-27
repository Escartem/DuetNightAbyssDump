local CountTrigger_C = {}

function CountTrigger_C.New(Count, Callback)
  local Obj = setmetatable({}, {__index = CountTrigger_C})
  Obj.Count = Count
  Obj.CurrentCount = 0
  Obj.Callback = Callback
  return Obj
end

function CountTrigger_C:CountIncrement()
  self.CurrentCount = self.CurrentCount + 1
  DebugPrint("CountIncrement", self.CurrentCount, self.Count)
  if self.CurrentCount == self.Count and self.Callback then
    self.Callback.Func(self.Callback.Obj)
  end
end

return CountTrigger_C
