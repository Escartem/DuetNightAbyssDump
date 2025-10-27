local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local GachaBase = Class("GachaBase", CustomTypes.CustomAttr)
GachaBase.__Props__ = {
  GachaId = prop.prop("Int", "client save", 0),
  DrawCounts = prop.prop("Int", "client save", 0),
  Usable = prop.prop("Int", "client save", 1),
  SelfSelect = prop.prop("Int", "client save", 0),
  Already5StarCount = prop.prop("Int", "client save", 0),
  GachaType = prop.getter("Data", "GachaType"),
  GachaTimes = prop.getter("Data", "GachaTimes"),
  GachaLimit = prop.getter("Data", "GachaLimit")
}

function GachaBase:Init(GachaId)
  if not GachaId then
    return
  end
  self.GachaId = GachaId
end

function GachaBase:SelfSelectData()
  return nil
end

function GachaBase:IsSelfSelectGacha()
  return self:SelfSelectData() ~= nil
end

function GachaBase:Type()
  return ""
end

FormatProperties(GachaBase)
local Gacha = Class("Gacha", GachaBase)
Gacha.__Props__ = {
  IsSendGachaResource = prop.prop("Int", "save", 0)
}

function Gacha:Data()
  return DataMgr.Gacha[self.GachaId]
end

function Gacha:SelfSelectData()
  return DataMgr.GachaSelect[self.GachaId]
end

FormatProperties(Gacha)
local GachaDictBase = Class("GachaDictBase", CustomTypes.CustomDict)
GachaDictBase.KeyType = BaseTypes.Int
GachaDictBase.ValueType = GachaBase

function GachaDictBase:NewGacha(GachaId)
  return self.ValueType(GachaId)
end

function GachaDictBase:UpdateUsable(GachaId, NewState)
  if not self[GachaId] then
    return
  end
  self[GachaId].Usable = NewState
  self[GachaId] = self[GachaId]
end

function GachaDictBase:SelfSelectItem(GachaId, ItemId)
  if not self[GachaId] then
    return
  end
  self[GachaId].SelfSelect = ItemId
  self[GachaId] = self[GachaId]
end

local GachaDict = Class("GachaDict", GachaDictBase)
GachaDict.ValueType = Gacha
local GachaRecord = Class("GachaRecord", CustomTypes.CustomAttr)
GachaRecord.__Props__ = {
  GachaId = prop.prop("Int", "save"),
  GachaType = prop.prop("Str", "save"),
  ItemId = prop.prop("Int", "save"),
  ItemType = prop.prop("Int", "save"),
  Count = prop.prop("Int", "save"),
  Star = prop.prop("Int", "save"),
  Time = prop.prop("Int", "save")
}

function GachaRecord:Init(GachaEntity, Record, Time)
  self.GachaId = GachaEntity.GachaId
  self.GachaType = GachaEntity:Type()
  self.ItemId = Record.ResultId
  self.ItemType = Record.Sign
  self.Count = Record.Count
  self.Star = Record.Star
  self.Time = Time
end

function GachaRecord:Replace(GachaEntity, Record, Time)
  local GachaId = GachaEntity.GachaId
  if self.GachaId ~= GachaId then
    self.GachaId = GachaId
  end
  local Type = GachaEntity:Type()
  if self.GachaType ~= Type then
    self.GachaType = Type
  end
  if self.ItemId ~= Record.ResultId then
    self.ItemId = Record.ResultId
  end
  if self.ItemType ~= Record.Sign then
    self.ItemType = Record.Sign
  end
  if self.Count ~= Record.Count then
    self.Count = Record.Count
  end
  if self.Star ~= Record.Star then
    self.Star = Record.Star
  end
  if self.Time ~= Time then
    self.Time = Time
  end
end

function GachaRecord:Dump()
  return {
    GachaId = self.GachaId,
    GachaType = self.GachaType,
    ItemId = self.ItemId,
    ItemType = self.ItemType,
    Count = self.Count,
    Star = self.Star,
    Time = self.Time
  }
end

FormatProperties(GachaRecord)
local GachaRecordQueue = Class("GachaRecordQueue", CustomTypes.CustomDict)
GachaRecordQueue.KeyType = BaseTypes.Int
GachaRecordQueue.ValueType = GachaRecord

function GachaRecordQueue:NewRecord(GachaEntity, Record, Time)
  return GachaRecord(GachaEntity, Record, Time)
end

local GuaranteedDict = Class("GuaranteedDict", CustomTypes.CustomDict)
GuaranteedDict.KeyType = BaseTypes.Str
GuaranteedDict.ValueType = CustomTypes.Str2IntDict
local SkinGacha = Class("SkinGacha", GachaBase)
SkinGacha.__Props__ = {
  CumulativeRewardGot = prop.prop("IntSet", "client save")
}

function SkinGacha:Data()
  return DataMgr.SkinGacha[self.GachaId]
end

function Gacha:SelfSelectData()
  return DataMgr.SkinGachaSelect[self.GachaId]
end

function GachaBase:Type()
  return "Skin"
end

FormatProperties(SkinGacha)
local SkinGachaDict = Class("SkinGachaDict", GachaDictBase)
SkinGachaDict.ValueType = SkinGacha
return {
  Gacha = Gacha,
  GachaDict = GachaDict,
  GachaRecord = GachaRecord,
  GachaRecordQueue = GachaRecordQueue,
  GuaranteedDict = GuaranteedDict,
  SkinGacha = SkinGacha,
  SkinGachaDict = SkinGachaDict
}
