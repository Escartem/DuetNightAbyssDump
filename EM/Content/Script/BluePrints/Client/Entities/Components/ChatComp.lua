local Decorator = require("BluePrints.Client.Wrapper.Decorator")
local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local MiscUtils = require("Utils.MiscUtils")
local Component = {}
for key, value in pairs(Decorator) do
  Component[key] = value
end
setmetatable(Component, getmetatable(Decorator))

local function Trim(input)
  return (string.gsub(input, "^%s*(.-)%s*$", "%1"))
end

function Component:EnterWorld()
  ChatController:Init()
  self.InWorldChatChannel = {}
  self.InWorldChatChannel[CommonConst.ChatChannel.Help] = false
  self.InWorldChatChannel[CommonConst.ChatChannel.TeamUp] = false
  self.InWorldChatChannel[CommonConst.ChatChannel.RegionOnline] = false
end

function Component:LeaveWorld()
  ChatController:Destory()
end

function Component:OnReconnectSuccessChatComp()
  if not self.InWorldChatChannel then
    return
  end
  local st1 = self.InWorldChatChannel[CommonConst.ChatChannel.Help]
  local st2 = self.InWorldChatChannel[CommonConst.ChatChannel.TeamUp]
  if st1 or st2 then
    self.InWorldChatChannel = {}
    self.InWorldChatChannel[CommonConst.ChatChannel.Help] = false
    self.InWorldChatChannel[CommonConst.ChatChannel.TeamUp] = false
    self:RequestEnterWorldChannel(CommonConst.ChatChannel.Help)
    self:RequestEnterWorldChannel(CommonConst.ChatChannel.TeamUp)
  end
  self.InWorldChatChannel[CommonConst.ChatChannel.RegionOnline] = false
end

function Component:RequestEnterWorldChannel(channel_type)
  self.logger.debug("RequestEnterWorldChannel: " .. channel_type)
  if self.InWorldChatChannel[channel_type] then
    return
  end
  self:CallServerMethod("RequestEnterWorldChannel", channel_type)
end

function Component:OnRequestEnterWorldChannel(channel_type, ret)
  self.logger.debug("OnRequestEnterWorldChannel: " .. channel_type .. " ret: " .. ret)
  if ChatController:CheckError(ret, true) then
    self.InWorldChatChannel[channel_type] = true
  end
  ChatController:RecvRequestEnterChatChannel(ret, channel_type)
end

function Component:RequestLeaveWorldChannel(channel_type)
  self.logger.debug("RequestLeaveWorldChannel: " .. channel_type)
  if not self.InWorldChatChannel[channel_type] then
    return
  end
  self:CallServerMethod("RequestLeaveWorldChannel", channel_type)
  self.InWorldChatChannel[channel_type] = false
end

function Component:OnRequestLeaveWorldChannel(channel_type, ret)
  self.logger.debug("OnRequestLeaveWorldChannel: " .. channel_type .. " ret: " .. ret)
end

function Component:GMGetMyChatChannelInfo()
  local function callback(channel_info)
    self.logger.debug("GMGetMyChatChannelInfo: channel_info: ")
    
    DebugPrintTable(channel_info)
  end
  
  self:CallServer("GMGetMyChatChannelInfo", callback)
end

function Component:GMGetAllChatChannelInfo(Callback)
  local function callback(channel_infos)
    self.logger.debug("GMGetAllChatChannelInfo: channel_infos: ")
    
    DebugPrintTable(channel_infos)
  end
  
  self:CallServer("GMGetAllChatChannelInfo", callback)
end

Component:LimitCall(CommonConst.CHAT_INTERVAL)

function Component:ChatToWorld(channel_type, content)
  self.logger.debug("Sending content to channel: " .. channel_type .. " content: " .. content)
  local ret = self:CheckChatToWorld(channel_type, content)
  if not ChatController:CheckError(ret, true) then
    return
  end
  
  local function callback(Ret)
    if not ChatController:CheckError(Ret, true) then
      self.logger.debug("ChatToWorld: ErrorCode: " .. Ret)
      return
    end
    ChatController:RecvChatToWorld(channel_type, content)
  end
  
  self:CallServer("ChatToWorld", callback, channel_type, content)
end

function Component:CheckChatToWorld(channel_type, content)
  if not self.InWorldChatChannel[channel_type] then
    return ErrorCode.RET_CHAT_NOT_JOIN_CHANNEL
  end
  if not content then
    return ErrorCode.RET_CHAT_MESSAGE_EMPTY
  end
  local real_content = MiscUtils.Trim(content)
  if "" == real_content then
    return ErrorCode.RET_CHAT_MESSAGE_EMPTY
  end
  return ErrorCode.RET_SUCCESS
end

function Component:WorldChatRequest(message)
  self:HandleChatRequest(message)
end

function Component:WorldChatRequests(messages)
  for i, message in ipairs(messages) do
    self:WorldChatRequest(message)
  end
end

function Component:ChatToPlayer(uid, content)
  self.logger.debug("Sending content to player: " .. uid .. " content: " .. content)
  local ret = self:CheckChatToPlayer(uid, content)
  if not ChatController:CheckError(ret, true) then
    return
  end
  
  local function callback(Ret)
    self.logger.debug("ChatToPlayer: ErrorCode: " .. Ret)
    if not ChatController:CheckError(Ret, true) then
      return
    end
    ChatController:RecvChatToPlayer(uid, content)
  end
  
  self:CallServer("ChatToPlayer", callback, uid, content)
end

function Component:CheckChatToPlayer(uid, content)
  if not content then
    return ErrorCode.RET_CHAT_MESSAGE_EMPTY
  end
  local real_content = MiscUtils.Trim(content)
  if "" == real_content then
    return ErrorCode.RET_CHAT_MESSAGE_EMPTY
  end
  if self.Blacklist[uid] then
    return ErrorCode.RET_CHAT_BLACKLISTED_PLAYER
  end
  return ErrorCode.RET_SUCCESS
end

function Component:PlayerChatRequest(message, by_myself)
  local other_uid, other
  if by_myself then
    other_uid = message.ReceiverUid
    other = self.Friends[other_uid]
    other = other.Info
  else
    other_uid = message.Sender.Uid
    other = message.Sender
  end
  if not other then
    self.logger.debug("PlayerChatRequest: other is nil")
    return
  end
  local chat = self.Chats[other_uid]
  if not chat then
    chat = self.Chats:NewChat(other)
  else
    chat.PlayerInfo = other
  end
  chat:AddMessage(message, by_myself)
  self.Chats[other_uid] = chat
  self:HandleChatRequest(message)
end

function Component:HandleChatRequest(message)
  self.logger.debug("HandleChatRequest: message: " .. message.Content)
  ChatController:HandleChatMessage(message)
end

function Component:ReadChat(uid)
  local function callback(ret)
    if not ChatController:CheckError(ret, true) then
      return
    end
    ChatController:RecvChatNewMsgRead(uid)
  end
  
  self:CallServer("ReadChat", callback, uid)
end

function Component:ChangeQuickMessage(index, content)
  local function callback(Ret)
    if not ChatController:CheckError(Ret, true) then
      return
    end
    ChatController:RecvChangeQuickMessage(index)
  end
  
  self:CallServer("ChangeQuickMessage", callback, index, content)
end

function Component:InitQuickMessage(SystemLanguage)
  local QuickMessages = {}
  for Id, Data in ipairs(DataMgr.DefaultQuickMsg) do
    local TextMap = DataMgr["TextMap_" .. SystemLanguage][Data.Text]
    if TextMap then
      local Text = TextMap[SystemLanguage]
      if Text then
        QuickMessages[#QuickMessages + 1] = Text
      end
    end
  end
  
  local function callback(ret)
  end
  
  self:CallServer("InitQuickMessage", callback, table.concat(QuickMessages, "_"))
end

function Component:AddEmotion(emotion_id)
  local function callback(Ret)
    if Ret == ErrorCode.RET_EMOTION_ID_EXIST then
      DebugPrint("\232\161\168\230\131\133\229\140\133\233\135\141\229\164\141\230\183\187\229\138\160\228\186\134\239\188\140\228\189\134\230\152\175\228\184\141\229\189\177\229\147\141\227\128\130\227\128\130\227\128\130\227\128\130\227\128\130\227\128\130\227\128\130\227\128\130\227\128\130")
      
      return
    end
    if not ChatController:CheckError(Ret, true) then
      return
    end
    ChatController:RecvAddEmotion(emotion_id)
  end
  
  self:CallServer("AddEmotion", callback, emotion_id)
end

function Component:RemoveEmotion(emotion_id)
  local function callback(Ret)
    if not ChatController:CheckError(Ret, true) then
      return
    end
    ChatController:RecvRemoveEmotion(emotion_id)
  end
  
  self:CallServer("RemoveEmotion", callback, emotion_id)
end

function Component:ChatToTeam(content)
  self.logger.debug("ChatToTeam", content)
  
  local function callback(Ret)
    self.logger.debug("ChatToTeam: ErrorCode: " .. Ret)
    if not ChatController:CheckError(Ret, true) then
      return
    end
    ChatController:RecvChatToTeam(content)
  end
  
  self:CallServer("ChatToTeam", callback, content)
end

function Component:TeamChatRequest(message)
  self:HandleChatRequest(message)
end

function Component:ChatToSettlementOnline(content)
  self.logger.debug("ChatToSettlementOnline", content)
  
  local function callback(Ret)
    self.logger.debug("ChatToSettlementOnline: ErrorCode: " .. Ret)
    if not ChatController:CheckError(Ret, true) then
      return
    end
    ChatController:RecvChatToSettlementOnline(content)
  end
  
  self:CallServer("ChatToSettlementOnline", callback, content)
end

function Component:SettlementOnlineChatRequest(message)
  self:HandleChatRequest(message)
end

function Component:OnForbidChat(time, reason, timeDelta)
  DebugPrint("OnForbidChat", time, reason)
  ChatController:OpenForbidChatDialog(time, reason, timeDelta)
end

function Component:ReportChat(reason, remark, chat_message)
  local function callback(Ret)
    self.logger.debug("ReportChat: ErrorCode: " .. Ret)
    
    local IsError = ErrorCode:Check(Ret, UIConst.Tip_CommonToast)
    if not IsError then
      return
    end
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Chat_ReportSuccess"))
  end
  
  self:CallServer("ReportChat", callback, reason, remark, chat_message)
end

function Component:SendModSuitToWorld(InCallbackInfo, channel_type, tag, eid, mod_suit_index)
  local function callback(Ret)
    self.logger.debug("SendModSuitToWorld: ErrorCode: " .. Ret)
    
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, channel_type, tag, eid, mod_suit_index)
  end
  
  self:CallServer("SendModSuitToWorld", callback, channel_type, tag, eid, mod_suit_index)
end

function Component:SetChatChannelMute(channel_type)
  self.logger.debug(string.format("SetChatChannelMute, channel_type:%s", channel_type))
  if not DataMgr.Channel[channel_type] then
    return
  end
  
  local function callback(ret)
    if not ChatController:CheckError(ret, true) then
      return false
    end
    ChatController:ClearChannelReddot(channel_type)
  end
  
  self:CallServer("SetChatChannelMute", callback, channel_type)
end

function Component:CancelChatChannelMute(channel_type)
  self.logger.debug(string.format("CancelChatChannelMute, channel_type:%s", channel_type))
  if not DataMgr.Channel[channel_type] then
    return
  end
  
  local function callback(ret)
  end
  
  self:CallServer("CancelChatChannelMute", callback, channel_type)
end

function Component:SetChatChannelClose(channel_type)
  self.logger.debug(string.format("SetChatChannelClose, channel_type:%s", channel_type))
  ChatController:RecvChatChannelSwitch(channel_type, true)
end

function Component:SetChatChannelOpen(channel_type)
  self.logger.debug(string.format("SetChatChannelOpen, channel_type:%s", channel_type))
  ChatController:RecvChatChannelSwitch(channel_type, false)
end

function Component:GMSetChatChannelClose(channel_type)
  self:CallServerMethod("GMSetChatChannelClose", channel_type)
end

function Component:GMSetChatChannelOpen(channel_type)
  self:CallServerMethod("GMSetChatChannelOpen", channel_type)
end

return Component
