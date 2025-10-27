local ok, CommonConst = pcall(require, "CommonConst")
if not ok then
  CommonConst = {SystemVoice = "CN"}
end
local Talk_Sound = setmetatable({}, {
  __index = function(t, key)
    if CommonConst.ArmoryVoice then
      return DataMgr["Talk_Sound" .. CommonConst.ArmoryVoice][key]
    else
      return DataMgr["Talk_Sound" .. CommonConst.SystemVoice][key]
    end
  end,
  __pairs = function(t)
    local realTbl
    if CommonConst.ArmoryVoice then
      realTbl = DataMgr["Talk_Sound" .. CommonConst.ArmoryVoice]
    else
      realTbl = DataMgr["Talk_Sound" .. CommonConst.SystemVoice]
    end
    local mt = getmetatable(realTbl)
    if mt and mt.__pairs then
      return mt.__pairs(realTbl)
    else
      return next, realTbl, nil
    end
  end
})
return Talk_Sound
