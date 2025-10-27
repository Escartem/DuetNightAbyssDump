require("UnLua")
local Trigger = {}

function Trigger:New(OriginTable, TriggerId)
  OriginTable = OriginTable or {}
  setmetatable(OriginTable, self)
  self.__index = self
  OriginTable.TriggerId = TriggerId
  OriginTable:InitEvents()
  return OriginTable
end

function Trigger:InitEvents()
  self.Events = {}
end

function Trigger:IsTriggered()
  return false
end

return Trigger
