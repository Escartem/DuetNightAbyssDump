local ok, CommonConst = pcall(require, "CommonConst")
if not ok then
  CommonConst = {
    SystemLanguage = "TextMapContent"
  }
end
local Dialogue = setmetatable({}, {
  __index = function(t, key)
    return DataMgr["Dialogue_" .. CommonConst.SystemLanguage][key]
  end,
  __pairs = function(t)
    local realTbl = DataMgr["Dialogue_" .. CommonConst.SystemLanguage]
    local mt = getmetatable(realTbl)
    if mt and mt.__pairs then
      return mt.__pairs(realTbl)
    else
      return next, realTbl, nil
    end
  end
})
return Dialogue
