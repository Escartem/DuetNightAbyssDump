local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Paotai = Class("Paotai", CustomTypes.CustomAttr)
Paotai.__Props__ = {
  PaotaiId = prop.prop("Int", "client save"),
  MaxScore = prop.prop("Int", "client save"),
  RewardsGot = prop.prop("Int2IntDict", "client save"),
  DungeonId = prop.getter("Data", "DungeonId"),
  StartTime = prop.getter("Data", "StartTime")
}

function Paotai:Data()
  return DataMgr.PaotaiMiniGame[self.PaotaiId]
end

function Paotai:Init(Id)
  self.PaotaiId = Id
  self.MaxScore = 0
end

function Paotai:SetMaxScore(Score)
  self.MaxScore = Score
end

function Paotai:GetMaxScore()
  return self.MaxScore
end

function Paotai:GetRewardsGotInfo()
  return self.RewardsGot
end

function Paotai:SetRewardsGot(RewardsGot)
  self.RewardsGot = RewardsGot
end

function Paotai:SetBuffs(Buffs)
  self.Buffs = Buffs
end

FormatProperties(Paotai)
local PaotaiDict = Class("PaotaiDict", CustomTypes.CustomDict)
PaotaiDict.KeyType = BaseTypes.Int
PaotaiDict.ValueType = Paotai

function PaotaiDict:Init(inner)
  self.Super.Init(self, inner)
end

function PaotaiDict:UnlockFirstDungeon()
  for _, Data in ipairs(DataMgr.PaotaiMiniGame) do
    self:GetNewPaotai(Data.Id)
    break
  end
end

function PaotaiDict:NewPaotai(PaotaiId)
  return Paotai(PaotaiId)
end

function PaotaiDict:GetPaotai(PaotaiId)
  return self[PaotaiId]
end

function PaotaiDict:GetNewPaotai(PaotaiId)
  if not self[PaotaiId] then
    self[PaotaiId] = self:NewPaotai(PaotaiId)
  end
  return self[PaotaiId]
end

function PaotaiDict:SetPaotai(PaotaiId, Paotai)
  self[PaotaiId] = Paotai
end

function PaotaiDict:PaotaiSetMaxScore(PaotaiId, Score)
  local Pt = self:GetPaotai(PaotaiId)
  Pt:SetMaxScore(Score)
  self[PaotaiId] = Pt
end

function PaotaiDict:PaotaiSetRewardsGot(PaotaiId, RewardsGot)
  local Pt = self:GetPaotai(PaotaiId)
  Pt:SetRewardsGot(RewardsGot)
  self[PaotaiId] = Pt
end

function PaotaiDict:PaotaiSetBuffs(PaotaiId, Buffs)
  local Pt = self:GetPaotai(PaotaiId)
  Pt:SetBuffs(Buffs)
  self[PaotaiId] = Pt
end

local PaotaiEventDict = Class("PaotaiEventDict", CustomTypes.CustomDict)
PaotaiEventDict.KeyType = BaseTypes.Int
PaotaiEventDict.ValueType = PaotaiDict

function PaotaiEventDict:NewPaotaiDict()
  return PaotaiDict()
end

function PaotaiEventDict:GetNewPaotaiEvent(EventId)
  if not self[EventId] then
    self[EventId] = self:NewPaotaiDict()
  end
  return self[EventId]
end

function PaotaiEventDict:GetPaotaiEvent(EventId)
  return self[EventId]
end

function PaotaiEventDict:SetPaotaiEvent(EventId, PaotaiEvent)
  self[EventId] = PaotaiEvent
end

return {
  Paotai = Paotai,
  PaotaiDict = PaotaiDict,
  PaotaiEventDict = PaotaiEventDict
}
