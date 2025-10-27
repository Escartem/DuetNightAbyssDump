local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local TimeUtils
if GWorld:IsSkynetServer() then
  TimeUtils = require("src.utils.TimeUtils")
else
  TimeUtils = require("Utils.TimeUtils")
end
local BanInfo = Class("BanInfo", CustomTypes.CustomAttr)
BanInfo.__Props__ = {
  BanTime = prop.prop("Int", "save"),
  Reason = prop.prop("Str", "save"),
  Uid = prop.prop("Int", "save")
}

function BanInfo:HasBan()
  local ban_time = self.BanTime
  local res = false
  if ban_time < 0 or ban_time > TimeUtils.NowTime() then
    res = true
  end
  return res
end

function BanInfo:GetLeftTime()
  local ban_time = self.BanTime
  local res = 0
  if ban_time < 0 then
    res = -1
  else
    res = math.max(0, ban_time - TimeUtils.NowTime())
  end
  return res
end

FormatProperties(BanInfo)
local BanIdDict = Class("BanIdDict", CustomTypes.CustomDict)
BanIdDict.KeyType = BaseTypes.ObjId
BanIdDict.ValueType = BanInfo

function BanIdDict:NewBan(time, reason, uid)
  local info = BanInfo()
  if time >= 0 then
    info.BanTime = time
  end
  info.Reason = reason
  info.Uid = uid or 0
  return info
end

local BanStrDict = Class("BanStrDict", CustomTypes.CustomDict)
BanStrDict.KeyType = BaseTypes.Str
BanStrDict.ValueType = BanInfo

function BanStrDict:NewBan(time, reason, uid)
  local info = BanInfo()
  if time >= 0 then
    info.BanTime = time
  end
  info.Reason = reason
  info.Uid = uid or 0
  return info
end

return {
  BanInfo = BanInfo,
  BanIdDict = BanIdDict,
  BanStrDict = BanStrDict
}
