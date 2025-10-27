local core = require("md5.core")

function core.sumhexa(k)
  k = core.sum(k)
  return (string.gsub(k, ".", function(c)
    return string.format("%02x", string.byte(c))
  end))
end

local function get_ipad(c)
  return string.char(c:byte() ~ 54)
end

local function get_opad(c)
  return string.char(c:byte() ~ 92)
end

function core.hmacmd5(data, key)
  if #key > 64 then
    key = core.sum(key)
    key = key:sub(1, 16)
  end
  local ipad_s = key:gsub(".", get_ipad) .. string.rep("6", 64 - #key)
  local opad_s = key:gsub(".", get_opad) .. string.rep("\\", 64 - #key)
  local istr = core.sum(ipad_s .. data)
  local ostr = core.sumhexa(opad_s .. istr)
  return ostr
end

return core
