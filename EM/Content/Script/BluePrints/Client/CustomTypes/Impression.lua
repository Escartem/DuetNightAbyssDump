local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CommonConst = require("CommonConst")
local DefaultValue = 1
local ImpressionAttr = Class("ImpressionAttr", CustomTypes.CustomAttr)
ImpressionAttr.__Props__ = {
  ImprCheckOptionEnum = prop.prop("Str", "client save"),
  ImprPlusOptionEnum = prop.prop("Str", "client save"),
  IsAddSuccess = prop.prop("Bool", "client save"),
  IsCheckSuccess = prop.prop("Bool", "client save"),
  Rand1 = prop.prop("Int", "client save"),
  Rand2 = prop.prop("Int", "client save"),
  Options = prop.prop("Str", "client save"),
  NodeId = prop.prop("Str", "client save")
}

function ImpressionAttr:Init(Param)
  if not Param or type(Param) ~= table then
    return
  end
  self:CopyParams(Param)
end

function ImpressionAttr:CopyParams(Param)
  self.ImprCheckOptionEnum = Param.ImprCheckOptionEnum
  self.IsCheckSuccess = Param.IsCheckSuccess
  self.Options = Param.Options
  self.Rand1 = Param.Rand1
  self.Rand2 = Param.Rand2
  self.IsAddSuccess = Param.IsAddSuccess
  self.ImprPlusOptionEnum = Param.ImprPlusOptionEnum
  self.NodeId = Param.NodeId
end

FormatProperties(ImpressionAttr)
local ImpressionAttrDict = Class("ImpressionAttrDict", CustomTypes.CustomDict)
ImpressionAttrDict.KeyType = BaseTypes.Str
ImpressionAttrDict.ValueType = ImpressionAttr

function ImpressionAttrDict:GetImpressionAttr(StoryNodeId)
  return self[StoryNodeId]
end

function ImpressionAttrDict:GetNewImpressionAttr(StoryNodeId, Param)
  if not self[StoryNodeId] then
    self[StoryNodeId] = self:NewImpressionAttr(Param)
  end
  self[StoryNodeId]:CopyParams(Param)
  return self[StoryNodeId]
end

function ImpressionAttrDict:NewImpressionAttr(Param)
  return ImpressionAttr(Param)
end

local Impression = Class("Impression", CustomTypes.CustomAttr)
Impression.__Props__ = {
  RegionId = prop.prop("Int", "client save", 0),
  Benefit = prop.prop("Int", "client save", 0),
  Morality = prop.prop("Int", "client save", 0),
  Wisdom = prop.prop("Int", "client save", 0),
  Empathy = prop.prop("Int", "client save", 0),
  Chaos = prop.prop("Int", "client save", 0),
  StoryNodeComplete = prop.prop("ImpressionAttrDict", "client save"),
  StoryLineComplete = prop.prop("Str2IntDict", "client save"),
  CurrentStoryNode = prop.prop("ImpressionAttrDict", "client save")
}

function Impression:InitImpression(RegionId)
  RegionId = tonumber(RegionId)
  if not RegionId or RegionId <= 0 then
    return
  end
  self.RegionId = tonumber(RegionId)
  self.Benefit = 1
  self.Morality = 1
  self.Wisdom = 1
  self.Empathy = 1
  self.Chaos = 1
end

function Impression:AddImpressionValueByType(ImpressionType, Value)
  local CurrentValue = self[ImpressionType] + Value
  local MaxValue = DataMgr.GlobalConstant.ImressionMax.ConstantValue
  if CurrentValue < DefaultValue then
    self[ImpressionType] = DefaultValue
  elseif CurrentValue > MaxValue then
    self[ImpressionType] = MaxValue
  else
    self[ImpressionType] = CurrentValue
  end
end

function Impression:GetImpressionValueByType(ImpressionType)
  return self[ImpressionType]
end

FormatProperties(Impression)
local ImpressionDict = Class("ImpressionDict", CustomTypes.CustomDict)
ImpressionDict.KeyType = BaseTypes.Int
ImpressionDict.ValueType = Impression

function ImpressionDict:NewImpression(RegionId)
  local NImpression = Impression(RegionId)
  NImpression:InitImpression(RegionId)
  return NImpression
end

function ImpressionDict:GetImpression(RegionId)
  if not self[RegionId] then
    self[RegionId] = self:NewImpression(RegionId)
  end
  return self[RegionId]
end

return {
  Impression = Impression,
  ImpressionDict = ImpressionDict,
  ImpressionAttrDict = ImpressionAttrDict,
  ImpressionAttr = ImpressionAttr
}
