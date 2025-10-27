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
local Buff = Class("Buff", CustomTypes.CustomAttr)
Buff.__Props__ = {
  BuffId = prop.prop("Int", "client save cross"),
  StartTime = prop.prop("Int", "client save cross"),
  Duration = prop.prop("Int", "client save cross"),
  Level = prop.prop("Int", "client save cross"),
  IsPlayerLevelBuff = prop.prop("Bool", "save", false)
}

function Buff:Init(BuffId)
  self.BuffId = BuffId
  self:RefreshBuffStartTime()
end

function Buff:RefreshBuffStartTime(Time)
  self.StartTime = Time or TimeUtils.NowTime()
end

function Buff:SetBuffDuration(Duration)
  if Duration == CommonConst.AvatarBuffPermanent or Duration > 0 then
    self.Duration = Duration
  end
end

function Buff:GetBuffRemainingTime()
  return math.max(self.StartTime + self.Duration - TimeUtils.NowTime(), 0)
end

function Buff:CheckBuffIsDue()
  if self.Duration == CommonConst.AvatarBuffPermanent then
    return false
  end
  return self.StartTime + self.Duration < TimeUtils.NowTime()
end

function Buff:CheckBuffIsPermanent()
  if self.Duration == CommonConst.AvatarBuffPermanent then
    return true
  end
  return false
end

function Buff:SetBuffLevel(Level)
  if Level and Level >= 0 then
    self.Level = Level
  end
end

function Buff:GetBuffLevel()
  return self.Level or 1
end

function Buff:SetIsPlayerLevelBuff(bPlayerLevel)
  self.IsPlayerLevelBuff = bPlayerLevel
end

function Buff:CheckIsPlayerLevelBuff()
  return self.IsPlayerLevelBuff
end

FormatProperties(Buff)
local BuffDict = Class("BuffDict", CustomTypes.CustomDict)
BuffDict.KeyType = BaseTypes.Int
BuffDict.ValueType = Buff

function BuffDict:NewBuff(BuffId)
  return Buff(BuffId)
end

function BuffDict:GetBuff(BuffId)
  if not self[BuffId] then
    return self:NewBuff(BuffId)
  end
  return self[BuffId]
end

return {Buff = Buff, BuffDict = BuffDict}
