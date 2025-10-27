local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local ZhiLiuEntrust = Class("ZhiLiuEntrust", CustomTypes.CustomAttr)
ZhiLiuEntrust.__Props__ = {
  Key = prop.prop("Int", "client save"),
  Time = prop.getter("Data", "Time"),
  SubmitEntrustID = prop.getter("Data", "SubmitEntrustID"),
  CombatEntrustID = prop.getter("Data", "CombatEntrustID"),
  CombatEntrustCompleted = prop.prop("Bool", "client save", false),
  SubmitEntrustCompleted = prop.prop("Bool", "client save", false)
}

function ZhiLiuEntrust:Init(Key)
  self.Key = Key
end

function ZhiLiuEntrust:Data()
  return DataMgr.ZhiLiuDateTab[self.Key]
end

FormatProperties(ZhiLiuEntrust)
local ZhiLiuEntrustDict = Class("ZhiLiuEntrustDict", CustomTypes.CustomDict)
ZhiLiuEntrustDict.KeyType = BaseTypes.Int
ZhiLiuEntrustDict.ValueType = ZhiLiuEntrust

function ZhiLiuEntrustDict:NewZhiLiuEntrust(ZhiLiuEntrustId)
  return ZhiLiuEntrust(ZhiLiuEntrustId)
end

return {ZhiLiuEntrustDict = ZhiLiuEntrustDict, ZhiLiuEntrust = ZhiLiuEntrust}
