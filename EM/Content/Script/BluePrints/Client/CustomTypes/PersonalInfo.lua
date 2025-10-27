local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local PERSONAL_INFO_UNIT_COUNT = 3
local PersonalInfoUnit = Class("PersonalInfoUnit", CustomTypes.CustomAttr)
PersonalInfoUnit.__Props__ = {
  Id = prop.prop("ObjId", "client save"),
  AppearancePlan = prop.prop("Int", "client save", -1),
  ModPlan = prop.prop("Int", "client save", 1)
}
FormatProperties(PersonalInfoUnit)

function PersonalInfoUnit:Init(Id, AppearancePlan, ModPlan)
  self.Id = Id
  self.AppearancePlan = AppearancePlan
  self.ModPlan = ModPlan
end

local PersonalInfoUnitList = Class("PersonalInfoUnitList", CustomTypes.CustomList)
PersonalInfoUnitList.ValueType = PersonalInfoUnit
local PersonalInfo = Class("PersonalInfo", CustomTypes.CustomAttr)
PersonalInfo.__Props__ = {
  CharDisplay = prop.prop("PersonalInfoUnitList", "client save"),
  WeaponDisplay = prop.prop("PersonalInfoUnitList", "client save"),
  Visible = prop.prop("Int", "client save", 1)
}
FormatProperties(PersonalInfo)

function PersonalInfo:AddCharDisplay(Id, AppearancePlan, ModPlan)
  if self.CharDisplay:Length() >= PERSONAL_INFO_UNIT_COUNT then
    return false
  end
  self.CharDisplay:Append(PersonalInfoUnit(Id, AppearancePlan, ModPlan))
  return true
end

function PersonalInfo:HasCharDisplay(Id)
  for i = 1, self.CharDisplay:Length() do
    local Unit = self.CharDisplay:Get(i)
    if Unit.Id == Id then
      return true
    end
  end
  return false
end

function PersonalInfo:AddWeaponDisplay(Id, ModPlan)
  if self.WeaponDisplay:Length() >= PERSONAL_INFO_UNIT_COUNT then
    return false
  end
  self.WeaponDisplay:Append(PersonalInfoUnit(Id, -1, ModPlan))
  return true
end

function PersonalInfo:HasWeaponDisplay(Id)
  for i = 1, self.WeaponDisplay:Length() do
    local Unit = self.WeaponDisplay:Get(i)
    if Unit.Id == Id then
      return true
    end
  end
  return false
end

return {
  PersonalInfo = PersonalInfo,
  PersonalInfoUnit = PersonalInfoUnit,
  PersonalInfoUnitList = PersonalInfoUnitList
}
