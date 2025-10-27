local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Chat = Class("Chat", CustomTypes.CustomAttr)
Chat.__Props__ = {
  Uid = prop.prop("Int", "client save"),
  PlayerInfo = prop.prop("AvatarInfo.AvatarInfo", "client save"),
  Messages = prop.prop("Message.Messages", "client save"),
  LastTime = prop.prop("Float", "client save"),
  LastMessage = prop.prop("Message.Message", "client save"),
  UnreadCount = prop.prop("Int", "client save")
}

function Chat:Init(player)
  if not player then
    return
  end
  self.Uid = player.Uid
  self.PlayerInfo = player
end

function Chat:AddMessage(message, by_myself)
  if self.Messages:Length() >= DataMgr.Channel[CommonConst.ChatChannel.Friend].MessageMax then
    self.Messages:Pop(1)
  end
  self.LastTime = math.max(self.LastTime, message.Time)
  self.LastMessage = message
  self.Messages:Append(message)
end

function Chat:AddUnreadCount()
  if self.UnreadCount >= DataMgr.Channel[CommonConst.ChatChannel.Friend].MessageMax then
    self.UnreadCount = self.UnreadCount - 1
  end
  self.UnreadCount = self.UnreadCount + 1
end

function Chat:ClearUnreadCount()
  self.UnreadCount = 0
end

function Chat:GetUnreadCount()
  local MaxUnreadCount = DataMgr.Channel[CommonConst.ChatChannel.Friend].MessageMax
  if MaxUnreadCount < self.UnreadCount then
    return MaxUnreadCount
  else
    return self.UnreadCount
  end
end

function Chat:SetMsgCache(MsgText)
  self.MsgCache = MsgText
end

function Chat:GetMsgCache()
  if not self.MsgCache then
    return ""
  end
  return self.MsgCache
end

FormatProperties(Chat)
local ChatDict = Class("ChatDict", CustomTypes.CustomDict)
ChatDict.KeyType = BaseTypes.Int
ChatDict.ValueType = Chat

function ChatDict:NewChat(player)
  local chat = Chat(player)
  return chat
end

return {Chat = Chat, ChatDict = ChatDict}
