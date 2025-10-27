local TalkDelegate_C = Class()

function TalkDelegate_C.New(GroupTag, TalkDelegateManager)
  local Obj = {}
  setmetatable(Obj, {__index = TalkDelegate_C})
  Obj.GroupTag = GroupTag
  Obj.TalkDelegatemanager = TalkDelegateManager
  Obj.List = {}
  return Obj
end

function TalkDelegate_C:Add(Obj, Func, ...)
  if not self.TalkDelegatemanager:CheckDelegateValid(self.GroupTag, self) then
    return self
  end
  table.insert(self.List, {
    Obj = Obj,
    Func = Func,
    Params = table.pack(...)
  })
  return self
end

function TalkDelegate_C:Remove(Obj, Func)
  if not self.TalkDelegatemanager:CheckDelegateValid(self.GroupTag, self) then
    return self
  end
  for i = #self.List, 1, -1 do
    local Data = self.List[i]
    if Data.Obj == Obj and Data.Func == Func then
      table.remove(self.List, i)
      return self
    end
  end
end

function TalkDelegate_C:Fire(...)
  local OverrideParams = {
    ...
  }
  if not self.TalkDelegatemanager:CheckDelegateValid(self.GroupTag, self) then
    return
  end
  for _, Data in pairs(self.List) do
    local Obj = Data.Obj
    local Func = Data.Func
    local Params = #OverrideParams > 0 and OverrideParams or Data.Params
    Func(Obj, table.unpack(Params))
  end
end

local TalkDelegateManager_C = {}

function TalkDelegateManager_C.New()
  local Obj = {}
  setmetatable(Obj, {__index = TalkDelegateManager_C})
  Obj.DelegateData = {}
  return Obj
end

function TalkDelegateManager_C:CreateDelegate(GroupTag)
  if not self.DelegateData[GroupTag] then
    self.DelegateData[GroupTag] = {}
  end
  local TalkDelegate = TalkDelegate_C.New(GroupTag, self)
  self.DelegateData[GroupTag][TalkDelegate] = true
  return TalkDelegate
end

function TalkDelegateManager_C:ClearGroup(GroupTag)
  self.DelegateData[GroupTag] = nil
end

function TalkDelegateManager_C:CheckDelegateValid(GroupTag, Delegate)
  if self.DelegateData[GroupTag] and self.DelegateData[GroupTag][Delegate] then
    return true
  end
  return false
end

return {TalkDelegate_C = TalkDelegate_C, TalkDelegateManager_C = TalkDelegateManager_C}
