local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Squad = Class("Squad", CustomTypes.CustomAttr)
Squad.__Props__ = {
  Name = prop.prop("Str", "client save", ""),
  Char = prop.prop("ObjId", "client save", ""),
  ModSuit = prop.prop("Int", "client save", 0),
  MeleeWeapon = prop.prop("ObjId", "client save", ""),
  MeleeWeaponModSuit = prop.prop("Int", "client save", 0),
  RangedWeapon = prop.prop("ObjId", "client save", ""),
  RangedWeaponModSuit = prop.prop("Int", "client save", 0),
  Pet = prop.prop("Int", "client save", 0),
  WheelIndex = prop.prop("Int", "client save", 0),
  Phantom1 = prop.prop("ObjId", "client save", ""),
  PhantomWeapon1 = prop.prop("ObjId", "client save", ""),
  Phantom2 = prop.prop("ObjId", "client save", ""),
  PhantomWeapon2 = prop.prop("ObjId", "client save", "")
}
FormatProperties(Squad)

function Squad:Init(Info)
  self:Update(Info)
end

function Squad:Update(Info)
  for k, v in pairs(Info) do
    self[k] = v
  end
end

function Squad:Dump()
  return self:save_dump(self)
end

local SquadList = Class("SquadList", CustomTypes.CustomList)
SquadList.ValueType = Squad

function SquadList:NewSquad(Index, Info)
  self[Index] = Squad(Info)
end

function SquadList:CreateSquad(Info)
  return Squad(Info)
end

return {Squad = Squad, SquadList = SquadList}
