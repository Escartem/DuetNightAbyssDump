local PropUtils = {}

function PropUtils.IsObjId(str)
  if type(str) ~= "string" then
    return false
  end
  if 14 == #str and 0 == string.byte(string.sub(str, 1, 1)) then
    return true
  end
  return false
end

function PropUtils.IsObjIdStr(ObjIdStr)
  if 36 ~= string.len(ObjIdStr) then
    return false
  end
  if string.sub(ObjIdStr, 1, 8) ~= "ObjectId" then
    return false
  end
  return true
end

function PropUtils.ObjId2Str(ObjId)
  local ret = PropUtils.ObjId2Str2(ObjId)
  return "ObjectId('" .. ret .. "')"
end

function PropUtils.ObjId2Str2(ObjId)
  local ret = ""
  if nil == ObjId then
    return ""
  end
  for index = 3, #ObjId do
    ret = ret .. string.format("%02X", string.byte(string.sub(ObjId, index, index)))
  end
  return ret
end

function PropUtils.DeepCopy(Object)
  local function _copy(object)
    if type(object) ~= "table" then
      return object
    end
    local new_table = {}
    for key, value in pairs(object) do
      new_table[_copy(key)] = _copy(value)
    end
    return setmetatable(new_table, getmetatable(object))
  end
  
  return _copy(Object)
end

function PropUtils.Split(str, reps)
  local Results = {}
  string.gsub(str, "[^" .. reps .. "]+", function(w)
    table.insert(Results, w)
  end)
  return Results
end

function PropUtils.Keys(Table)
  local keys = {}
  for k, v in pairs(Table) do
    table.insert(keys, k)
  end
  return keys
end

return PropUtils
