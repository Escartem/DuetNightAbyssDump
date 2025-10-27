local prop = require("NetworkEngine.Common.Prop")
local AccountImplement = {
  _id = prop.prop("ObjId", "client save"),
  Account = prop.prop("Str", "client save"),
  Hostnum = prop.prop("Int", "client save"),
  GroupId = prop.prop("Int", "client save"),
  AvatarId = prop.prop("ObjId", "client save")
}
return AccountImplement
