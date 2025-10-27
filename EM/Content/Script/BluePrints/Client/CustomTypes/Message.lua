local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Message = Class("Message", CustomTypes.CustomAttr)
Message.__Props__ = {
  Content = prop.prop("Str", "client save"),
  Time = prop.prop("Float", "client save"),
  Sender = prop.prop("AvatarInfo.AvatarInfo", "client save"),
  Receiver = prop.prop("ObjId", "client save"),
  ReceiverUid = prop.prop("Int", "client save"),
  Type = prop.prop("Int", "client save"),
  ChannelType = prop.prop("Int", "client save", 0)
}

function Message:Init(mtype)
  self.Type = mtype
end

function Message:Serialize()
  return self:all_dump(self)
end

FormatProperties(Message)
local Messages = Class("Messages", CustomTypes.CustomList)
Messages.ValueType = Message
return {Message = Message, Messages = Messages}
