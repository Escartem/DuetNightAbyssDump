local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local DoubleModDrop = Class("DoubleModDrop", CustomTypes.CustomAttr)
DoubleModDrop.__Props__ = {
  EventId = prop.prop("Int", "client save"),
  DropTimes = prop.prop("Int", "client save", 0),
  EliteRushTimes = prop.prop("Int", "client save", 0),
  ModDungeonId = prop.getter("Data", "ModDungeonId"),
  EliteRushDungeonId = prop.getter("Data", "EliteRushDungeonId")
}

function DoubleModDrop:Data()
  return DataMgr.DoubleModDrop[self.EventId]
end

function DoubleModDrop:Init(EventId)
  self.EventId = EventId
end

function DoubleModDrop:RefreshTimes()
  self.DropTimes = 0
  self.EliteRushTimes = 0
end

function DoubleModDrop:GetDropTimes()
  return self.DropTimes
end

function DoubleModDrop:AddDropTimes()
  self.DropTimes = self.DropTimes + 1
end

function DoubleModDrop:GetEliteRushTimes()
  return self.EliteRushTimes
end

function DoubleModDrop:AddEliteRushTimes()
  self.EliteRushTimes = self.EliteRushTimes + 1
end

function DoubleModDrop:IsModDungeon(DungeonId)
  for _, D in ipairs(self.ModDungeonId) do
    if DungeonId == D then
      return true
    end
  end
  return false
end

function DoubleModDrop:IsEliteRushDungeon(DungeonId)
  for _, D in ipairs(self.EliteRushDungeonId) do
    if DungeonId == D then
      return true
    end
  end
  return false
end

FormatProperties(DoubleModDrop)
local DoubleModDropDict = Class("DoubleModDropDict", CustomTypes.CustomDict)
DoubleModDropDict.KeyType = BaseTypes.Int
DoubleModDropDict.ValueType = DoubleModDrop

function DoubleModDropDict:GetNewDoubleModDrop(EventId)
  if not self[EventId] then
    self[EventId] = self:NewDoubleModDrop(EventId)
  end
  return self[EventId]
end

function DoubleModDropDict:NewDoubleModDrop(EventId)
  return DoubleModDrop(EventId)
end

function DoubleModDropDict:GetDoubleModDrop(EventId)
  return self[EventId]
end

function DoubleModDropDict:SetDoubleModDrop(EventId, DoubleModDropEvent)
  self[EventId] = DoubleModDropEvent
end

function DoubleModDropDict:RefreshDoubleModDrop(EventId)
  local DoubleModDropEvent = self[EventId]
  if not DoubleModDropEvent then
    return
  end
  DoubleModDropEvent:RefreshTimes()
  self[EventId] = DoubleModDropEvent
end

return {DoubleModDrop = DoubleModDrop, DoubleModDropDict = DoubleModDropDict}
