local Class = _G.TypeClass
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local SimpleChar = Class("SimpleChar", CustomTypes.CustomAttr)
SimpleChar.__Props__ = {
  CharId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save", 1),
  EnhanceLevel = prop.prop("Int", "client save", 0),
  GradeLevel = prop.prop("Int", "client save", 0),
  SkinId = prop.prop("Int", "client save", 0),
  Skills = prop.prop("Skill.SkillList", "client save"),
  ModSlots = prop.prop("Mod.SimpleModSlots", "client save")
}
FormatProperties(SimpleChar)
local SimpleWeapon = Class("SimpleWeapon", CustomTypes.CustomAttr)
SimpleWeapon.__Props__ = {
  WeaponId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save", 1),
  EnhanceLevel = prop.prop("Int", "client save", 0),
  GradeLevel = prop.prop("Int", "client save", 0),
  Skills = prop.prop("Skill.SkillList", "client save"),
  ModSlots = prop.prop("Mod.SimpleModSlots", "client save")
}
FormatProperties(SimpleWeapon)
return {SimpleChar = SimpleChar, SimpleWeapon = SimpleWeapon}
