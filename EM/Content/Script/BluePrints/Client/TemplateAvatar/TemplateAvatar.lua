local prop = require("NetworkEngine.Common.Prop")
local TemplateAvatarAttr = {
  CurrentChar = prop.prop("ObjId", "client save"),
  MeleeWeapon = prop.prop("ObjId", "client save"),
  RangedWeapon = prop.prop("ObjId", "client save"),
  Chars = prop.prop("Character.CharDict", "client save proto"),
  CommonChars = prop.prop("CharacterCommon.CommonCharDict", "client save"),
  OtherCharSkins = prop.prop("Int2IntListDict", "client save"),
  Weapons = prop.prop("Weapon.WeaponDict", "client save meta"),
  UWeapons = prop.prop("Weapon.UWeaponDict", "client save meta"),
  OwnedWeaponSkins = prop.prop("Int2IntDict", "client save"),
  CharAccessorys = prop.prop("IntList", "client save"),
  WeaponAccessorys = prop.prop("IntList", "client save"),
  Mods = prop.prop("Mod.ModDict", "client save"),
  OriginalMods = prop.prop("Int2ObjIdDict", "client save"),
  Pets = prop.prop("Pet.PetDict", "client save"),
  PetUniqueID = prop.prop("Int", "save", 1)
}
return TemplateAvatarAttr
