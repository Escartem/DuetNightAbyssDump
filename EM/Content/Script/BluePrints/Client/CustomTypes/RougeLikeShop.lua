local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RougeLikeShop = Class("RougeLikeShop", CustomTypes.CustomAttr)
RougeLikeShop.__Props__ = {
  ShopBlessing = prop.prop("Int2IntDict", "save"),
  ShopTreasure = prop.prop("Int2IntDict", "save"),
  ShopItem = prop.prop("Int2IntDict", "save")
}

function RougeLikeShop:Init(ShopBlessing, ShopTreasure, ShopItem)
  self:NewShopBlessing(ShopBlessing)
  self:NewShopTreasure(ShopTreasure)
  self:NewShopItem(ShopItem)
end

function RougeLikeShop:NewShopBlessing(Blessings)
  if not Blessings then
    return
  end
  for i = 1, #Blessings do
    self.ShopBlessing[Blessings[i]] = 1
  end
end

function RougeLikeShop:NewShopTreasure(Treasures)
  if not Treasures then
    return
  end
  for i = 1, #Treasures do
    self.ShopTreasure[Treasures[i]] = 1
  end
end

function RougeLikeShop:NewShopItem(Items)
  if not Items then
    return
  end
  for k, v in pairs(Items) do
    self.ShopItem[k] = v
  end
end

FormatProperties(RougeLikeShop)
local RougeLikeShopDict = Class("RougeLikeShop", CustomTypes.CustomDict)
RougeLikeShopDict.KeyType = BaseTypes.Int
RougeLikeShopDict.ValueType = RougeLikeShop

function RougeLikeShopDict:NewShop(Blessings, Treasures, Items)
  return RougeLikeShop(Blessings, Treasures, Items)
end

return {RougeLikeShop = RougeLikeShop, RougeLikeShopDict = RougeLikeShopDict}
