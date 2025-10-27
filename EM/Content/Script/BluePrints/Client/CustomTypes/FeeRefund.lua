local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local FeeRefund = Class("FeeRefund", CustomTypes.CustomAttr)
FeeRefund.__Props__ = {
  Id = prop.prop("Int", "save", 0),
  Phoxene = prop.prop("Int", "client save", 0),
  MonthlyCard = prop.prop("Int", "client save", 0)
}
FormatProperties(FeeRefund)

function FeeRefund:Init(Id)
  self.Id = Id
end

local FeeRefundDict = Class("FeeRefundDict", CustomTypes.CustomDict)
FeeRefundDict.KeyType = BaseTypes.Int
FeeRefundDict.ValueType = FeeRefund

function FeeRefundDict:New(Id)
  return FeeRefund(Id)
end

return {FeeRefundDict = FeeRefundDict, FeeRefund = FeeRefund}
