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
local FishingSpot = Class("FishingSpot", CustomTypes.CustomAttr)
FishingSpot.__Props__ = {
  FishingSpotId = prop.prop("Int", "client save"),
  GotFishCount = prop.prop("Int", "save", 0),
  RemainFishCount = prop.prop("Int", "client save", -1),
  LastRefreshTime = prop.prop("Int", "client save", 0),
  ConditionId = prop.getter("Data", "ConditionId"),
  FishCountLimit = prop.getter("Data", "FishCountLimit"),
  LimitDeviation = prop.getter("Data", "LimitDeviation"),
  ReplenishDay = prop.getter("Data", "ReplenishDay"),
  WaterType = prop.getter("Data", "WaterType"),
  FishId = prop.getter("Data", "FishId"),
  FishWeight = prop.getter("Data", "FishWeight")
}

function FishingSpot:Data()
  return DataMgr.FishingSpot[self.FishingSpotId]
end

function FishingSpot:Init(FishingSpotId)
  if not FishingSpotId then
    return
  end
  if not DataMgr.FishingSpot[FishingSpotId] then
    return
  end
  self.FishingSpotId = FishingSpotId
  self:InitLastRefreshTime()
end

function FishingSpot:InitLastRefreshTime()
  local StartTime = TimeUtils.DataToTimestamp(CommonConst.ShopRefreshBeginTime[1], CommonConst.ShopRefreshBeginTime[2], CommonConst.ShopRefreshBeginTime[3], CommonConst.ShopRefreshBeginTime[4], CommonConst.ShopRefreshBeginTime[5], CommonConst.ShopRefreshBeginTime[6])
  local year, month, day, hour, min, sec = TimeUtils.TimestampToData(StartTime)
  local refresh_hms = CommonConst.GAME_REFRESH_HMS
  self.LastRefreshTime = TimeUtils.DataToTimestamp(year, month, day, table.unpack(refresh_hms))
end

function FishingSpot:CheckCanFish()
  return self.RemainFishCount > 0
end

function FishingSpot:ReduceRemainFishCount()
  if self:CheckCanFish() then
    self.RemainFishCount = self.RemainFishCount - 1
    self.GotFishCount = self.GotFishCount + 1
  end
end

FormatProperties(FishingSpot)
local FishingSpotDict = Class("FishingSpotDict", CustomTypes.CustomDict)
FishingSpotDict.KeyType = BaseTypes.Int
FishingSpotDict.ValueType = FishingSpot

function FishingSpotDict:NewFishingSpot(FishingSpotId)
  return FishingSpot(FishingSpotId)
end

function FishingSpotDict:GetFishingSpot(FishingSpotId)
  if not self[FishingSpotId] then
    return self:NewFishingSpot(FishingSpotId)
  end
  return self[FishingSpotId]
end

local FishSize = Class("FishSize", CustomTypes.CustomAttr)
FishSize.__Props__ = {
  FishId = prop.prop("Int", "client save"),
  FishSize2Count = prop.prop("Int2IntDict", "client save"),
  FishSize2Lock = prop.prop("Int2BoolDict", "client save")
}

function FishSize:Init(FishId, FishSize, Count)
  if not FishId then
    return
  end
  self.FishId = FishId
  self:AddCount(FishSize, Count)
end

function FishSize:GetCount(FishSize)
  local Count = self.FishSize2Count[FishSize] or 0
  return Count
end

function FishSize:AddCount(FishSize, Count)
  Count = Count or 1
  if self.FishSize2Count[FishSize] then
    self.FishSize2Count[FishSize] = self.FishSize2Count[FishSize] + Count
  else
    self.FishSize2Count[FishSize] = Count
    self.FishSize2Lock[FishSize] = false
  end
end

function FishSize:ReduceCount(FishSize, Count)
  if not self.FishSize2Count[FishSize] then
    return false
  end
  if Count > self.FishSize2Count[FishSize] then
    return false
  end
  if self.FishSize2Count[FishSize] == Count then
    self.FishSize2Count[FishSize] = nil
    self.FishSize2Lock[FishSize] = nil
  else
    self.FishSize2Count[FishSize] = self.FishSize2Count[FishSize] - Count
  end
end

function FishSize:LockFishSize(FishSize)
  if self.FishSize2Lock[FishSize] == nil then
    return false
  end
  self.FishSize2Lock[FishSize] = true
  return true
end

function FishSize:UnLockFishSize(FishSize)
  if self.FishSize2Lock[FishSize] == nil then
    return false
  end
  self.FishSize2Lock[FishSize] = false
  return true
end

function FishSize:GetLockState(FishSize)
  return self.FishSize2Lock[FishSize]
end

FormatProperties(FishSize)
local FishSizeDict = Class("FishSizeDict", CustomTypes.CustomDict)
FishSizeDict.KeyType = BaseTypes.Int
FishSizeDict.ValueType = FishSize

function FishSizeDict:NewFishSize(FishId, Size, Count)
  return FishSize(FishId, Size, Count)
end

function FishSizeDict:GetFishSize(FishId, Size)
  if not self[FishId] then
    return self:NewFishSize(FishId, Size)
  end
  return self[FishId]
end

return {
  FishingSpot = FishingSpot,
  FishingSpotDict = FishingSpotDict,
  FishSize = FishSize,
  FishSizeDict = FishSizeDict
}
