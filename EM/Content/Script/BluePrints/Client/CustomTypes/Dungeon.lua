local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Dungeon = Class("Dungeon", CustomTypes.CustomAttr)
Dungeon.__Props__ = {
  DungeonId = prop.prop("Int", "client save"),
  State = prop.prop("Int", "client save", 1),
  Squad = prop.prop("Int", "client save", 0),
  EnterCount = prop.prop("Int", "client save"),
  PassCount = prop.prop("Int", "client save"),
  IsPass = prop.prop("Bool", "client save"),
  MaxStar = prop.prop("Int", "client save", 0),
  DungeonProgress = prop.prop("Int", "client", 0),
  DungeonSid = prop.prop("ObjId", "save"),
  PersistenceData = prop.prop("Str", "save"),
  DungeonName = prop.getter("Data", "DungeonName"),
  DungeonReward = prop.getter("Data", "DungeonReward"),
  DungeonType = prop.getter("Data", "DungeonType"),
  DungeonWinMode = prop.getter("Data", "DungeonWinMode"),
  FirstCompleteReward = prop.getter("Data", "FirstCompleteReward"),
  IsWeeklyDungeon = prop.getter("Data", "IsWeeklyDungeon"),
  IsModDungeon = prop.getter("Data", "IsModDungeon")
}

function Dungeon:Data()
  return DataMgr.Dungeon[self.DungeonId]
end

function Dungeon:Init(DungeonId)
  if not DungeonId then
    return
  end
  self.DungeonId = DungeonId
  self.IsPass = false
end

function Dungeon:AddEnterCount()
  self.EnterCount = self.EnterCount + 1
end

function Dungeon:RefreshDungeonSid(Sid)
  self.DungeonSid = Sid
end

function Dungeon:SetPass()
  self.PassCount = self.PassCount + 1
  if self.IsPass then
    return false
  else
    self.IsPass = true
    return true
  end
end

function Dungeon:PersistentData(DataStr)
  if not DataStr then
    return
  end
  self.PersistenceData = DataStr
end

function Dungeon:GetPersistenceData()
  return self.PersistenceData
end

FormatProperties(Dungeon)
local DungeonDict = Class("DungeonDict", CustomTypes.CustomDict)
DungeonDict.KeyType = BaseTypes.Int
DungeonDict.ValueType = Dungeon

function DungeonDict:NewDungeon(DungeonId)
  local dungeon = Dungeon(DungeonId)
  return dungeon
end

return {Dungeon = Dungeon, DungeonDict = DungeonDict}
