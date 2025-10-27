local M = {}

function M.__newindex(t, k, v)
  local mt = getmetatable(t)
  local p = mt[k]
  local vt = type(p)
  if "userdata" == vt then
    SetUProperty(t, p, v)
    if not rawget(t, "LuaValueTable") then
      rawset(t, "LuaValueTable", {})
    end
    rawset(t.LuaValueTable, k, v)
  else
    rawset(t, k, v)
  end
end

function M.__index(t, k)
  local v = rawget(t.LuaValueTable, k)
  if nil == v then
    v = getmetatable(t)[k]
    if type(v) == "userdata" then
      v = GetUProperty(t, v)
      rawset(t.LuaValueTable, k, v)
    end
  end
  return v
end

function M:Initialize()
  rawset(self, "LuaValueTable", {})
end

function M:SetVec3Property_Lua(PropertyName, Value)
  rawset(self.LuaValueTable, PropertyName, Value)
end

function M:SetStringProperty_Lua(PropertyName, Value)
  rawset(self.LuaValueTable, PropertyName, Value)
end

function M:SetIntProperty_Lua(PropertyName, Value)
  rawset(self.LuaValueTable, PropertyName, Value)
end

function M:SetFloatProperty_Lua(PropertyName, Value)
  rawset(self.LuaValueTable, PropertyName, Value)
end

function M:SetBoolProperty_Lua(PropertyName, Value)
  rawset(self.LuaValueTable, PropertyName, Value)
end

return M
