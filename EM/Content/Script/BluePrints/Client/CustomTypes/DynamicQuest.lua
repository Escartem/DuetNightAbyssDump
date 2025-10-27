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
local DynamicQuestState = {
  inactive = 0,
  active = 1,
  doing = 2,
  success = 3,
  fail = 4
}
local DynamicQuest = Class("DynamicQuest", CustomTypes.CustomAttr)
DynamicQuest.__Props__ = {
  DynamicQuestId = prop.prop("Int", "client save"),
  State = prop.prop("Int", "client save", 0),
  StartTime = prop.prop("Int", "client save", 0),
  LastEndTime = prop.prop("Int", "client save", 0),
  AlreadyCompleteTimes = prop.prop("Int", "client save", 0),
  UnlockCondition = prop.getter("Data", "UnlockCondition"),
  ChanceCondition = prop.getter("Data", "ChanceCondition"),
  Chance = prop.getter("Data", "Chance"),
  DayLimit = prop.getter("Data", "DayLimit"),
  CompleteNum = prop.getter("Data", "CompleteNum"),
  DynCD = prop.getter("Data", "DynCD"),
  Reward = prop.getter("Data", "Reward")
}

function DynamicQuest:Init(DynamicQuestId)
  self.DynamicQuestId = DynamicQuestId
end

function DynamicQuest:Data()
  return DataMgr.DynQuest[self.DynamicQuestId]
end

function DynamicQuest:RefreshDynamicQuestStartTime(Time)
  self.StartTime = Time or TimeUtils.NowTime()
end

function DynamicQuest:RefreshDynamicQuestLastEndTime(Time)
  self.LastEndTime = Time
end

function DynamicQuest:GetDynamicQuestRemainingTime()
  local DueTime = DataMgr.GlobalConstant.DynServerLimitTime.ConstantValue
  return math.max(self.StartTime + DueTime - TimeUtils.NowTime(), 0)
end

function DynamicQuest:CheckDynamicQuestIsDue()
  local DueTime = DataMgr.GlobalConstant.DynServerLimitTime.ConstantValue
  return self.StartTime + DueTime < TimeUtils.NowTime()
end

function DynamicQuest:AddCompleteTimes()
  if -1 ~= self.CompleteNum and self.AlreadyCompleteTimes >= self.CompleteNum then
    return false
  end
  self.AlreadyCompleteTimes = self.AlreadyCompleteTimes + 1
  return true
end

function DynamicQuest:IsHaveRemainTimes()
  if -1 == self.CompleteNum then
    return true
  end
  return self.CompleteNum > self.AlreadyCompleteTimes
end

function DynamicQuest:IsInCD()
  if self.DynCD == nil then
    return false
  end
  if self:IsSuccess() then
    return TimeUtils.NowTime() - self.LastEndTime < self.DynCD[1]
  elseif self:IsFail() then
    return TimeUtils.NowTime() - self.LastEndTime < self.DynCD[2]
  end
  return false
end

function DynamicQuest:GetDynamicQuestRemainingCD()
  if self.DynCD == nil then
    return 0
  end
  if not self:IsInCD() then
    return 0
  end
  if self:IsSuccess() then
    return math.max(0, self.DynCD[1] - (TimeUtils.NowTime() - self.LastEndTime))
  elseif self:IsFail() then
    return math.max(0, self.DynCD[2] - (TimeUtils.NowTime() - self.LastEndTime))
  end
  return 0
end

function DynamicQuest:IsInactive()
  return self.State == DynamicQuestState.inactive
end

function DynamicQuest:IsActive()
  return self.State == DynamicQuestState.active
end

function DynamicQuest:IsDoing()
  return self.State == DynamicQuestState.doing
end

function DynamicQuest:IsSuccess()
  return self.State == DynamicQuestState.success
end

function DynamicQuest:IsFail()
  return self.State == DynamicQuestState.fail
end

function DynamicQuest:Inactive()
  self.State = DynamicQuestState.Inactive
end

function DynamicQuest:Active()
  if self:IsInactive() then
    self.State = DynamicQuestState.active
    return true
  end
  if self:IsSuccess() and self:IsHaveRemainTimes() then
    self.State = DynamicQuestState.active
    return true
  end
  if self:IsFail() and self:IsHaveRemainTimes() then
    self.State = DynamicQuestState.active
    return true
  end
  return false
end

function DynamicQuest:Doing()
  if self:IsActive() then
    self.State = DynamicQuestState.doing
    return true
  end
  if self:IsSuccess() and self:IsHaveRemainTimes() then
    self.State = DynamicQuestState.doing
    return true
  end
  if self:IsFail() and self:IsHaveRemainTimes() then
    self.State = DynamicQuestState.doing
    return true
  end
  return false
end

function DynamicQuest:ForceDoing()
  self.State = DynamicQuestState.doing
end

function DynamicQuest:Success()
  if self:IsDoing() then
    self.State = DynamicQuestState.success
    return true
  end
  return false
end

function DynamicQuest:Fail()
  if self:IsDoing() then
    self.State = DynamicQuestState.fail
    return true
  end
  return false
end

FormatProperties(DynamicQuest)
local DynamicQuestDict = Class("DynamicQuestDict", CustomTypes.CustomDict)
DynamicQuestDict.KeyType = BaseTypes.Int
DynamicQuestDict.ValueType = DynamicQuest

function DynamicQuestDict:NewDynamicQuest(DynamicQuestId)
  return DynamicQuest(DynamicQuestId)
end

function DynamicQuestDict:GetDynamicQuest(DynamicQuestId)
  if not self[DynamicQuestId] then
    return self:NewDynamicQuest(DynamicQuestId)
  end
  return self[DynamicQuestId]
end

return {DynamicQuest = DynamicQuest, DynamicQuestDict = DynamicQuestDict}
