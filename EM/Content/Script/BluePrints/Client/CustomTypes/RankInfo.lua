local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RankListItem = Class("RankListItem", CustomTypes.CustomAttr)
RankListItem.__Props__ = {
  Eid = prop.prop("ObjId", "save"),
  CostTime = prop.prop("Float", "save"),
  Round = prop.prop("Int", "save"),
  Score = prop.prop("Int", "save"),
  Damage = prop.prop("Int", "save"),
  Time = prop.prop("Int", "save")
}

function RankListItem:Init(Eid, CostTime, Round, Score)
  self.Eid = Eid
  self.CostTime = CostTime or 0
  self.Round = Round or 0
  self.Score = Score or 0
end

function RankListItem:SetTime(time)
  self.Time = time
end

FormatProperties(RankListItem)
local RankListContainer = Class("RankListContainer", CustomTypes.CustomList)
RankListContainer.ValueType = RankListItem
local RankDetailInfo = Class("RankDetailInfo", CustomTypes.CustomAttr)
RankDetailInfo.__Props__ = {
  Eid = prop.prop("ObjId", "save"),
  Account = prop.prop("Str", "save"),
  Char = prop.prop("SimpleCommonInfo.SimpleChar", "save"),
  MeleeWeapon = prop.prop("SimpleCommonInfo.SimpleWeapon", "save"),
  RangedWeapon = prop.prop("SimpleCommonInfo.SimpleWeapon", "save"),
  RankValue = prop.prop("Float", "save"),
  Time = prop.prop("Int", "save"),
  Damage = prop.prop("Int", "save")
}

function RankDetailInfo:Init(Eid)
  if not Eid then
    return
  end
  self.Eid = Eid
end

function RankDetailInfo:Update(info)
  for key, value in pairs(info) do
    GWorld.logger.debug("RankDetailInfo Update", key)
    self[key] = value
  end
end

FormatProperties(RankDetailInfo)
local RankDetailInfos = Class("RankDetailInfos", CustomTypes.CustomDict)
RankDetailInfos.KeyType = BaseTypes.ObjId
RankDetailInfos.ValueType = RankDetailInfo

function RankDetailInfos:NewRankDetailInfo(Eid)
  return RankDetailInfo(Eid)
end

return {
  RankListItem = RankListItem,
  RankListContainer = RankListContainer,
  RankDetailInfo = RankDetailInfo,
  RankDetailInfos = RankDetailInfos
}
