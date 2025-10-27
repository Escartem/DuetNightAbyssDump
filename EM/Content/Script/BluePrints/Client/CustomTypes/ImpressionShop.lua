local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local ImpressionShopItem = Class("ImpressionShopItem", CustomTypes.CustomAttr)
ImpressionShopItem.__Props__ = {
  ImpressionShopId = prop.prop("Int", "client save"),
  AlreadyPurchaseTimes = prop.prop("Int", "client save", 0),
  ImpressionShopState = prop.prop("Bool", "client save"),
  RegionId = prop.getter("Data", "RegionId"),
  ItemType = prop.getter("Data", "ItemType"),
  ItemId = prop.getter("Data", "ItemId"),
  TypeNum = prop.getter("Data", "TypeNum"),
  PriceType = prop.getter("Data", "PriceType"),
  Price = prop.getter("Data", "Price"),
  PurchaseLimit = prop.getter("Data", "PurchaseLimit"),
  UnlockCondition = prop.getter("Data", "UnlockCondition"),
  ImprCheckId = prop.getter("Data", "ImprCheckId")
}

function ImpressionShopItem:SetShopState(NewState)
  if NewState == self.ImpressionShopState then
    return false
  end
  self.ImpressionShopState = NewState
  return true
end

function ImpressionShopItem:AddAlreadyPurchaseTimes()
  self.AlreadyPurchaseTimes = self.AlreadyPurchaseTimes + 1
end

function ImpressionShopItem:Init(ImpressionShopId)
  self.ImpressionShopId = ImpressionShopId
end

function ImpressionShopItem:Data()
  return DataMgr.ImpressionShop[self.ImpressionShopId]
end

FormatProperties(ImpressionShopItem)
local ImpressionShopItemDict = Class("ImpressionShopItemDict", CustomTypes.CustomDict)
ImpressionShopItemDict.KeyType = BaseTypes.Int
ImpressionShopItemDict.ValueType = ImpressionShopItem

function ImpressionShopItemDict:NewImpressionShopItem(ItemId)
  return ImpressionShopItem(ItemId)
end

function ImpressionShopItemDict:GetNewImpressionShopItem(ImpressionShopId)
  if not self[ImpressionShopId] then
    self[ImpressionShopId] = self:NewImpressionShopItem(ImpressionShopId)
  end
  return self[ImpressionShopId]
end

function ImpressionShopItemDict:GetImpressionShopItem(ItemId)
  return self[ItemId]
end

return {ImpressionShopItemDict = ImpressionShopItemDict, ImpressionShopItem = ImpressionShopItem}
