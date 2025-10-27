local MiscUtils = require("Utils.MiscUtils")
local BattleEvents = {}
local BattleEventLogic = {}

function BattleEventLogic:ReceiveBeginPlay()
  if not IsAuthority(self) then
    self.RegisterBattleEvent = MiscUtils.EmptyFunction
    self.UnregisterBattleEvent = MiscUtils.EmptyFunction
    self.TriggerBattleEvent = MiscUtils.EmptyFunction
    return
  end
  self.Components = {}
  self.TickableComponents = {}
  self.AllBattleEvent = {}
  self.BattleEventIndex = 1
  self.AllMulticastBattleEvent = {}
  self:InitBattleEvent()
end

function BattleEventLogic:InitBattleEvent()
  for _, EventPath in pairs(BattleEvents) do
    local Module = require("BluePrints.Combat.BattleEvents." .. EventPath)
    table.insert(self.Components, Module)
    if Module.Tick then
      table.insert(self.TickableComponents, Module)
    end
    Module:Init(self)
  end
end

function BattleEventLogic:InitBattleEventWithPath(EventPath)
  local Module = require("BluePrints.Combat.BattleEvents." .. EventPath)
  table.insert(self.Components, Module)
  if Module.Tick then
    table.insert(self.TickableComponents, Module)
  end
  Module:Init(self)
  Module.EventPath = "BluePrints.Combat.BattleEvents." .. EventPath
end

function BattleEventLogic:DestoryBattleEvent(EventPath)
  local Path = "BluePrints.Combat.BattleEvents." .. EventPath
  if self.Components then
    for _, Module in pairs(self.Components) do
      if Module.EventPath == Path then
        Module:Destroy(self)
        return
      end
    end
  end
end

return BattleEventLogic
