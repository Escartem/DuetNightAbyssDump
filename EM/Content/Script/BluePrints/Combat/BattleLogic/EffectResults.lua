local function UnpackEffectStruct(InEffectStruct)
  if not InEffectStruct then
    return
  end
  local Str = InEffectStruct:GetResult()
  if not Str then
    return
  end
  local msgpack = require("msgpack_core")
  local Result = msgpack.unpack(Str)
  return Result
end

local function ToEffectStruct(self, InEffectStruct)
  self.Add = nil
  self.ToEffectStruct = nil
  if self.IsEmpty then
    return
  end
  self.IsEmpty = nil
  local EffectStruct = InEffectStruct
  if nil == EffectStruct then
    EffectStruct = FEffectStruct()
  end
  local msgpack = require("msgpack_core")
  local s0 = msgpack.pack(self)
  if not s0 then
    PrintTable({self = self}, 10)
  end
  EffectStruct:SetResult(s0, #s0)
  return EffectStruct
end

local LocalResults = {
  IsEmpty = true,
  Add = function(self, Value)
    Value.Add = nil
    Value.ToEffectStruct = nil
    if Value.IsEmpty then
      return
    end
    Value.IsEmpty = nil
    self.IsEmpty = false
    table.insert(self, Value)
  end,
  ToEffectStruct = ToEffectStruct
}
local LocalResult = {
  IsEmpty = true,
  Add = function(self, Type, Value)
    self.IsEmpty = false
    table.insert(self, {
      [Type] = Value
    })
  end,
  ToEffectStruct = ToEffectStruct
}
local EffectResults = {
  Results = function()
    local _LocalResults = New(LocalResults)
    setmetatable(_LocalResults, {
      __newindex = function(mytable, key, value)
        rawset(mytable, "IsEmpty", false)
        rawset(mytable, key, value)
      end
    })
    return _LocalResults
  end,
  Result = function()
    local _LocalResult = New(LocalResult)
    setmetatable(_LocalResult, {
      __newindex = function(mytable, key, value)
        rawset(mytable, "IsEmpty", false)
        rawset(mytable, key, value)
      end
    })
    return _LocalResult
  end,
  UnpackEffectStruct = UnpackEffectStruct
}
return EffectResults
