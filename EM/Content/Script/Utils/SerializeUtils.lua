local bson = require("bson")
local SerializeUtils = {}

local function IsObjId(str)
  if 14 == #str and 0 == string.byte(string.sub(str, 1, 1)) then
    return true
  end
  return false
end

function SerializeUtils:ToStringEx(value)
  local ValueType = type(value)
  if "table" == ValueType then
    return self:TableToStr(value)
  elseif "string" == ValueType then
    if IsObjId(value) then
      return self:SerializeObjId(value)
    else
      return "'" .. value .. "'"
    end
  elseif "number" == ValueType or "boolean" == ValueType then
    return tostring(value)
  elseif "userdata" == ValueType then
    return self:SerializeUserdata(value)
  end
end

function SerializeUtils:TableToStr(t)
  if nil == t then
    return ""
  end
  local retstr = "{"
  local i = 1
  for key, value in pairs(t) do
    local signal = ","
    if 1 == i then
      signal = ""
    end
    if key == i then
      retstr = retstr .. signal .. self:ToStringEx(value)
    elseif type(key) == "number" or type(key) == "string" then
      retstr = retstr .. signal .. "[" .. self:ToStringEx(key) .. "]=" .. self:ToStringEx(value)
    elseif type(key) == "userdata" then
      retstr = retstr .. signal .. "*s" .. self:TableToStr(getmetatable(key)) .. "*e" .. "=" .. self:ToStringEx(value)
    else
      retstr = retstr .. signal .. key .. ":" .. self:ToStringEx(value)
    end
    i = i + 1
  end
  retstr = retstr .. "}"
  return retstr
end

function SerializeUtils:StrToTable(str)
  print(_G.LogTag, str)
  if nil == str or type(str) ~= "string" or "" == str then
    return {}
  end
  return load("return " .. str)()
end

local function DefaultSerializeUserdata(value)
  return "\"" .. tostring(value) .. "\""
end

function SerializeUtils:SerializeUserdata(value)
  local result = {}
  if not value.IsSerializable or not value:IsSerializable() then
    print(_G.LogTag, "SerializeUtils:SerializeUserdata Failed for bSerialized is not exist.")
    return DefaultSerializeUserdata(value)
  end
  local str = CommonUtils.Split(tostring(value), ":")
  result.SerializeName = str[1]
  local ValueString = value:ToString()
  ValueString = string.gsub(ValueString, "\r\n", "")
  ValueString = string.gsub(ValueString, "%s+", "")
  result.ValueString = ValueString
  return self:TableToStr(result)
end

function SerializeUtils:SerializeObjId(value)
  local result = {}
  local ret = ""
  for index = 3, #value do
    ret = ret .. string.format("%02X", string.byte(string.sub(value, index, index)))
  end
  result.ObjIdStr = ret
  return self:TableToStr(result)
end

function SerializeUtils:TransformTable(Table)
  if Table.SerializeName then
    local userdata = load("return " .. Table.SerializeName .. "()")()
    userdata:InitFromString(Table.ValueString)
    return userdata
  elseif Table.ObjIdStr then
    return bson.objectid(Table.ObjIdStr)
  end
  for key, value in pairs(Table) do
    if type(value) == "table" then
      Table[key] = self:TransformTable(value)
    end
  end
  return Table
end

function SerializeUtils:Serialize(Table)
  return self:TableToStr(Table)
end

function SerializeUtils:UnSerialize(TableStr)
  return self:TransformTable(self:StrToTable(TableStr))
end

return SerializeUtils
