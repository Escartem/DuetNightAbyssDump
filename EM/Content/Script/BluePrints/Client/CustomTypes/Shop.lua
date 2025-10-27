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
local ShopItemRefreshTimeType = {
  NOREFRESH = 0,
  HOUR = 1,
  DAY = 2,
  WEEK = 3,
  MONTH = 4
}
local ShopItem = Class("ShopItem", CustomTypes.CustomAttr)
ShopItem.__Props__ = {
  ItemId = prop.prop("Int", "client save"),
  AlreadyPurchaseTimes = prop.prop("Int", "client save", 0),
  RemainPurchaseTimes = prop.prop("Int", "client save", -1),
  EnhanceRedDotCleaned = prop.prop("Bool", "client save", false),
  ItemType = prop.getter("Data", "ItemType"),
  TypeId = prop.getter("Data", "TypeId"),
  TypeNum = prop.getter("Data", "TypeNum"),
  PriceType = prop.getter("Data", "PriceType"),
  Price = prop.getter("Data", "Price"),
  SubTabId = prop.getter("Data", "SubTabId"),
  PurchaseLimit = prop.getter("Data", "PurchaseLimit"),
  StartTime = prop.getter("Data", "StartTime"),
  EndTime = prop.getter("Data", "EndTime"),
  LastRefreshTime = prop.prop("Int", "client save", 0)
}

function ShopItem:Init(ItemId)
  if not ItemId then
    return
  end
  self.ItemId = ItemId
  local PurchaseLimit = DataMgr.ShopItem[ItemId].PurchaseLimit
  if nil ~= PurchaseLimit then
    self.RemainPurchaseTimes = PurchaseLimit
  end
  self:SetRefreshTime(ItemId)
end

function ShopItem:Data()
  return DataMgr.ShopItem[self.ItemId]
end

function ShopItem:SetRefreshTime(ItemId)
  local RefreshTime = DataMgr.ShopItem[ItemId].RefreshTime
  local RefreshTimeType = ShopItemRefreshTimeType.NOREFRESH
  if RefreshTime then
    for key, value in pairs(RefreshTime) do
      if ShopItemRefreshTimeType[key] then
        RefreshTimeType = ShopItemRefreshTimeType[key]
      end
    end
  end
  local StartTime = TimeUtils.DataToTimestamp(CommonConst.ShopRefreshBeginTime[1], CommonConst.ShopRefreshBeginTime[2], CommonConst.ShopRefreshBeginTime[3], CommonConst.ShopRefreshBeginTime[4], CommonConst.ShopRefreshBeginTime[5], CommonConst.ShopRefreshBeginTime[6])
  if RefreshTimeType == ShopItemRefreshTimeType.HOUR or RefreshTimeType == ShopItemRefreshTimeType.DAY then
    local year, month, day, hour, min, sec = TimeUtils.TimestampToData(StartTime)
    local refresh_hms = CommonConst.GAME_REFRESH_HMS
    self.LastRefreshTime = TimeUtils.DataToTimestamp(year, month, day, table.unpack(refresh_hms))
  elseif RefreshTimeType == ShopItemRefreshTimeType.WEEK then
    StartTime = StartTime - CommonConst.SECOND_IN_WEEKDAY
    local refresh_hms = CommonConst.GAME_REFRESH_HMS
    self.LastRefreshTime = TimeUtils.NextWeeklyRefreshTime(StartTime, refresh_hms)
  elseif RefreshTimeType == ShopItemRefreshTimeType.MONTH then
    local year, month, day, hour, min, sec = TimeUtils.TimestampToData(StartTime)
    local refresh_hms = CommonConst.GAME_REFRESH_HMS
    self.LastRefreshTime = TimeUtils.DataToTimestamp(year, month, 1, table.unpack(refresh_hms))
  else
    self.LastRefreshTime = StartTime
  end
end

function ShopItem:IsPurchaseLimit()
  return self.PurchaseLimit ~= nil
end

function ShopItem:AddAlreadyPurchaseTimes(Count)
  if type(Count) == "number" and Count > 0 then
    self.AlreadyPurchaseTimes = self.AlreadyPurchaseTimes + Count
  end
end

function ShopItem:ReduceRemainPurchaseTimes(Count)
  if type(Count) == "number" and Count > 0 and Count <= self.RemainPurchaseTimes then
    self.RemainPurchaseTimes = self.RemainPurchaseTimes - Count
    return true
  end
  if -1 == self.RemainPurchaseTimes then
    return true
  end
  return false
end

function ShopItem:IsCanBeChased()
  return 0 ~= self.RemainPurchaseTimes
end

function ShopItem:CleanEnhanceRedDot()
  if not self.EnhanceRedDotCleaned then
    self.EnhanceRedDotCleaned = true
  end
end

FormatProperties(ShopItem)
local ShopItemDict = Class("ShopItemDict", CustomTypes.CustomDict)
ShopItemDict.KeyType = BaseTypes.Int
ShopItemDict.ValueType = ShopItem

function ShopItemDict:NewShopItem(ItemId)
  return ShopItem(ItemId)
end

function ShopItemDict:GetShopItem(ItemId)
  if nil == self[ItemId] then
    self[ItemId] = self:NewShopItem(ItemId)
  end
  return self[ItemId]
end

return {ShopItem = ShopItem, ShopItemDict = ShopItemDict}
