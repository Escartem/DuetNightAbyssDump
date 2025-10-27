local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local TimeUtils = require("Utils.TimeUtils")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local DailyLogin = Class("DailyLogin", CustomTypes.CustomAttr)
DailyLogin.__Props__ = {
  EventID = prop.prop("Int", "client save"),
  LastDailyLoginTime = prop.prop("Int", "client save", 0),
  DailyLoginCount = prop.prop("Int", "client save", 0),
  RewardsRecord = prop.prop("Int2IntDict", "client save", {})
}

function DailyLogin:Init(EventID)
  self.EventID = EventID
end

function DailyLogin:GetEventID()
  return self.EventID
end

function DailyLogin:IsToDayHaveRewardToRecv()
  local DailyLoginConfig = DataMgr.DailyLogin[self.EventID]
  if DailyLoginConfig.LoginDuration ~= nil and self.DailyLoginCount > DailyLoginConfig.LoginDuration then
    return false
  end
  if self.LastDailyLoginTime > TimeUtils.TimestampLastClock(CommonConst.GAME_REFRESH_HMS[1]) then
    return 1 ~= self.RewardsRecord[self.DailyLoginCount]
  end
  return false
end

function DailyLogin:IsHaveRecvAllReward()
  local DailyLoginConfig = DataMgr.DailyLogin[self.EventID]
  local NeedCheckDay = self.DailyLoginCount <= DailyLoginConfig.LoginDuration and self.DailyLoginCount or DailyLoginConfig.LoginDuration
  local IsHaveRecvAllReward = true
  for SignDayIndex = 1, NeedCheckDay do
    if 1 ~= self.RewardsRecord[SignDayIndex] then
      IsHaveRecvAllReward = false
      break
    end
  end
  return IsHaveRecvAllReward
end

function DailyLogin:CanRecvReward(SignDayIndex)
  return 1 ~= self.RewardsRecord[SignDayIndex]
end

function DailyLogin:IsSignInday(SignDayIndex)
  return SignDayIndex <= self.DailyLoginCount
end

FormatProperties(DailyLogin)
local DailyLoginDict = Class("DailyLoginDict", CustomTypes.CustomDict)
DailyLoginDict.KeyType = BaseTypes.Int
DailyLoginDict.ValueType = DailyLogin

function DailyLoginDict:NewDailyLogin(EventID)
  return DailyLogin(EventID)
end

return {DailyLogin = DailyLogin, DailyLoginDict = DailyLoginDict}
