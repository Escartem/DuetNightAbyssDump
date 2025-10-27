local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CommonConst = require("CommonConst")
local LimitedResource = Class("LimitedResource", CustomTypes.CustomAttr)
LimitedResource.__Props__ = {
  LimitedResourceId = prop.prop("Int", "client save"),
  LimitedTimeId = prop.prop("Int", "client save"),
  CreateTime = prop.prop("Int", "client save"),
  IsSendTwoMail = prop.prop("Bool", "client save"),
  IsSendOneMail = prop.prop("Bool", "client save"),
  EndTime = prop.getter("LimitedResourceData", "EndTime"),
  MailRemindId = prop.getter("LimitedResourceData", "MailRemindId"),
  TransResourceId = prop.getter("LimitedResourceData", "TransResourceId"),
  TransType = prop.getter("LimitedResourceData", "TransType"),
  TransCount = prop.getter("LimitedResourceData", "TransCount")
}

function LimitedResource:Init(LimitedResourceId, LimitedTimeId)
  self.LimitedResourceId = LimitedResourceId
  self.LimitedTimeId = LimitedTimeId
  self.CreateTime = TimeUtils.NowTime()
end

function LimitedResource:GetSendTwoMail()
  return self.IsSendTwoMail
end

function LimitedResource:GetSendOneMail()
  return self.IsSendOneMail
end

function LimitedResource:SetSendOneMail()
  self.IsSendOneMail = true
end

function LimitedResource:SetSendTwoMail()
  self.IsSendTwoMail = true
end

function LimitedResource:Data()
  return DataMgr.LimitedTimeResource[self.LimitedResourceId]
end

function LimitedResource:LimitedResourceData()
  local LimitedResourceData = self:Data()
  return LimitedResourceData[self.LimitedTimeId]
end

FormatProperties(LimitedResource)
local LimitedResourceDict = Class("LimitedResourceDict", CustomTypes.CustomDict)
LimitedResourceDict.KeyType = BaseTypes.Int
LimitedResourceDict.ValueType = LimitedResource

function LimitedResourceDict:GetNewLimitedResource(LimitedResourceId, EndTimeIndex)
  if not self[LimitedResourceId] then
    self[LimitedResourceId] = self:NewLimitedResource(LimitedResourceId, EndTimeIndex)
  end
  return self[LimitedResourceId]
end

function LimitedResourceDict:GetLimitedResource(LimitedResourceId)
  return self[LimitedResourceId]
end

function LimitedResourceDict:NewLimitedResource(LimitedResourceId, EndTimeIndex)
  return LimitedResource(LimitedResourceId, EndTimeIndex)
end

return {LimitedResource = LimitedResource, LimitedResourceDict = LimitedResourceDict}
