local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local DungeonEventPet = Class("DungeonEventPet", CustomTypes.CustomAttr)
DungeonEventPet.__Props__ = {
  PetId = prop.prop("Int", "client save", 0)
}

function DungeonEventPet:Init(PetId)
  self.PetId = PetId
end

FormatProperties(DungeonEventPet)
local DungeonEventTreasure = Class("DungeonEventTreasure", CustomTypes.CustomAttr)
DungeonEventTreasure.__Props__ = {}
FormatProperties(DungeonEventTreasure)
local DungeonEventButcher = Class("DungeonEventButcher", CustomTypes.CustomAttr)
DungeonEventButcher.__Props__ = {}
FormatProperties(DungeonEventButcher)
local DungeonRandomEvent = Class("DungeonRandomEvent", CustomTypes.CustomAttr)
DungeonRandomEvent.__Props__ = {
  EventProbability = prop.prop("Int2FloatDict", "client save"),
  LastWin = prop.prop("Bool", "client save", true),
  LastEventId = prop.prop("Int", "client save", 0),
  CurrentEventId = prop.prop("Int", "client save", 0),
  Pet = prop.prop("DungeonEventPet", "client save"),
  Treasure = prop.prop("DungeonEventTreasure", "client save"),
  Butcher = prop.prop("DungeonEventButcher", "client save"),
  WeeklyHappenCount = prop.prop("Int2IntDict", "save", {})
}

function DungeonRandomEvent:NewPetEvent(PetId)
  self.Pet = DungeonEventPet(PetId)
  return
end

FormatProperties(DungeonRandomEvent)
return {
  DungeonEventTreasure = DungeonEventTreasure,
  DungeonEventButcher = DungeonEventButcher,
  DungeonEventPet = DungeonEventPet,
  DungeonRandomEvent = DungeonRandomEvent
}
