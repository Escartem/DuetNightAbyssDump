local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local MarkPointInfo = Class("MarkPointInfo", CustomTypes.CustomAttr)
MarkPointInfo.__Props__ = {
  Name = prop.prop("Str", "client save"),
  PositionX = prop.prop("Float", "client save"),
  PositionY = prop.prop("Float", "client save"),
  Type = prop.prop("Int", "client save"),
  FloorId = prop.prop("Int", "client save")
}

function MarkPointInfo:Init(Params)
  self:Update(Params)
end

function MarkPointInfo:Update(Params)
  self.Name = Params.Name
  self.PositionX = Params.PositionX
  self.PositionY = Params.PositionY
  self.Type = Params.Type
  self.FloorId = Params.FloorId
end

FormatProperties(MarkPointInfo)
local MarkPointInfoDict = Class("MarkPointInfoDict", CustomTypes.CustomDict)
MarkPointInfoDict.KeyType = BaseTypes.Str
MarkPointInfoDict.ValueType = MarkPointInfo

function MarkPointInfoDict:NewMarkPointInfo(Params)
  return MarkPointInfo(Params)
end

function MarkPointInfoDict:GetNewMarkPointInfo(MarkPointId, MarkPointParams)
  if not self[MarkPointId] then
    self[MarkPointId] = self:NewMarkPointInfo(MarkPointParams)
  end
  return self[MarkPointId]
end

function MarkPointInfoDict:GetMarkPointInfo(MarkPointId)
  return self[MarkPointId]
end

local MarkPoint = Class("MarkPoint", CustomTypes.CustomAttr)
MarkPoint.__Props__ = {
  RegionId = prop.prop("Int", "client save", 0),
  MarkPointData = prop.prop("MarkPointInfoDict", "client save"),
  Count = prop.prop("Int", "client save")
}

function MarkPoint:Init()
end

function MarkPoint:SetRegionId(RegionId)
  self.RegionId = RegionId
end

function MarkPoint:AddMarkPoint(MarkPointId, MarkPointParams)
  self.MarkPointData:GetNewMarkPointInfo(MarkPointId, MarkPointParams)
  self.Count = self.Count + 1
end

function MarkPoint:UpdateMarkPoint(MarkPointId, MarkPointParams)
  if not self.MarkPointData:GetMarkPointInfo(MarkPointId) then
    return
  end
  self.MarkPointData[MarkPointId]:Update(MarkPointParams)
end

function MarkPoint:DeleteMarkPoint(MarkPointKey)
  if not self.MarkPointData[MarkPointKey] then
    return
  end
  self.Count = self.Count - 1
  self.MarkPointData[MarkPointKey] = nil
end

FormatProperties(MarkPoint)
local MarkPointDict = Class("MarkPointDict", CustomTypes.CustomDict)
MarkPointDict.KeyType = BaseTypes.Int
MarkPointDict.ValueType = MarkPoint

function MarkPointDict:NewMarkPoint(RegionId)
  local lMarkPoint = MarkPoint()
  lMarkPoint:SetRegionId(RegionId)
  return lMarkPoint
end

function MarkPointDict:GetMarkPoint(RegionId)
  if not self[RegionId] then
    self[RegionId] = self:NewMarkPoint(RegionId)
  end
  return self[RegionId]
end

return {
  MarkPoint = MarkPoint,
  MarkPointInfo = MarkPointInfo,
  MarkPointInfoDict = MarkPointInfoDict,
  MarkPointDict = MarkPointDict
}
