local json = require("rapidjson")
local MessageWrap = {
  __index = {
    Message = nil,
    MsgType = nil,
    EmojiInfos = nil,
    ModSuitInfo = nil,
    Index = 0,
    _SetUpMessage = function(self, Message)
      if Message then
        self.Message = Message
      end
      local Content = self.Message.Content
      if not Content then
        return
      end
      self.EmojiInfos = {}
      for GroupId, Id in string.gmatch(Content, "%[(%d+)|([%w]+)%]") do
        GroupId = tonumber(GroupId) or nil
        if not GroupId or not DataMgr.EmojiGroup[GroupId] then
        elseif DataMgr.ChatEmoji[GroupId][Id] then
          table.insert(self.EmojiInfos, {
            GroupId = GroupId,
            Id = Id,
            bSticker = GroupId ~= ChatCommon.EmojiGroupId
          })
        end
      end
      for Id in string.gmatch(Content, "%[(%w+)%]") do
        if DataMgr.ChatEmoji[ChatCommon.EmojiGroupId][Id] then
          table.insert(self.EmojiInfos, {
            GroupId = ChatCommon.EmojiGroupId,
            Id = Id,
            bSticker = false
          })
        end
      end
      if string.startswith(Content, ChatCommon.ModSuitCopyHeader) then
        local JsonStr = string.sub(Content, #ChatCommon.ModSuitCopyHeader + 1)
        self.ModSuitInfo = json.decode(JsonStr)
      elseif string.startswith(Content, ChatCommon.DyePlanCopyHeader) then
        local JsonStr = string.sub(Content, #ChatCommon.DyePlanCopyHeader + 1)
        self.DyePlanInfo = json.decode(JsonStr)
      end
    end,
    IsSticker = function(self)
      if 0 == #self.EmojiInfos then
        DebugPrint(LogTag, LXYTag, "MessageWrap\228\184\141\229\173\152\229\156\168\232\161\168\230\131\133\229\140\133\228\191\161\230\129\175", self.Message.Content)
        return nil
      end
      for _, EmojiInfo in ipairs(self.EmojiInfos) do
        if not EmojiInfo.bSticker then
          return false
        end
      end
      return true
    end
  },
  New = function(Class, Message, MsgType)
    local NewObj = {}
    setmetatable(NewObj, Class)
    if MsgType then
      NewObj.MsgType = MsgType
    elseif Message.Type == CommonConst.MESSAGE_TYPE_SYSTEM then
      NewObj.MsgType = ChatCommon.MsgType.System
    elseif Message.Type == CommonConst.MESSAGE_TYPE_SELF then
      NewObj.MsgType = ChatCommon.MsgType.Self
    else
      NewObj.MsgType = ChatCommon.MsgType.Other
    end
    if Message.Sender and not Message.Sender.Nickname then
      Message.Sender.Nickname = ""
    end
    NewObj:_SetUpMessage(Message)
    return NewObj
  end
}
local MessageList = {
  __index = {
    ViewList = nil,
    Count = 0,
    UnreadCount = 0,
    NewTipWrap = nil,
    TimerKey = nil,
    ChannelType = nil,
    CDRemainTime = 0,
    MsgCache = "",
    RemovedMsgs = nil,
    AddMessage = function(self, Message, bCalcUnread)
      local MsgWrap = MessageWrap:New(Message)
      local LastMsgWrap = self.ViewList[#self.ViewList] or {
        Message = {Time = 0}
      }
      local TimeMsgWrap
      if MsgWrap.MsgType == ChatCommon.MsgType.Other or MsgWrap.MsgType == ChatCommon.MsgType.Self then
        local NewMsg = Message
        local LastMsg = LastMsgWrap.Message
        local ChannelConf = DataMgr.Channel[NewMsg.ChannelType]
        self.Count = self.Count + 1
        if self.Count > ChannelConf.MessageMax then
          self.Count = ChannelConf.MessageMax
          local StartIndex = 2
          for i = 1, 2 do
            local TempMsgWrap = self.ViewList[i]
            if TempMsgWrap.MsgType == ChatCommon.MsgType.Time then
              StartIndex = StartIndex + 1
            end
          end
          for _, RemovedMsg in ipairs(table.slice(self.ViewList, 1, StartIndex - 1)) do
            table.insert(self.RemovedMsgs, RemovedMsg)
          end
          self.ViewList = table.slice(self.ViewList, StartIndex, #self.ViewList)
        end
        if bCalcUnread then
          local lastUnreadCount = self.UnreadCount
          self.UnreadCount = self.UnreadCount + 1
        end
        if NewMsg.Time - LastMsg.Time > DataMgr.GlobalConstant.ChatTimeTipInterval.ConstantValue then
          TimeMsgWrap = MessageWrap:New({
            Time = NewMsg.Time,
            LastTime = LastMsg.Time
          }, ChatCommon.MsgType.Time)
          table.insert(self.ViewList, TimeMsgWrap)
        end
      elseif MsgWrap.MsgType == ChatCommon.MsgType.System then
      end
      table.insert(self.ViewList, MsgWrap)
      return TimeMsgWrap, MsgWrap
    end,
    ReadMessage = function(self)
      self.UnreadCount = 0
    end,
    ClearMessage = function(self)
      self.ViewList = {}
      self.Count = 0
      self.UnreadCount = 0
      self.ChannelType = nil
      self.MsgCache = ""
    end,
    UpdateFromChat = function(self, Chat)
      local MsgCache = self.MsgCache
      self:ClearMessage()
      self.ChannelType = ChatCommon.ChannelDef.Friend
      self.MsgCache = Chat.GetMsgCache and Chat:GetMsgCache() or ""
      if Chat.UnreadCount then
        self.UnreadCount = Chat:GetUnreadCount() - Chat.Messages:Length()
      else
        self.UnreadCount = -#Chat.Messages
      end
      for _, Message in ipairs(Chat.Messages) do
        Message.ChannelType = ChatCommon.ChannelDef.Friend
        if Message.Sender.Uid == GWorld:GetAvatar().Uid then
          Message.Type = CommonConst.MESSAGE_TYPE_SELF
        end
        self:AddMessage(Message, true)
      end
    end,
    GetOnceRemovedMsgs = function(self)
      local RemovedMsgs = self.RemovedMsgs
      self.RemovedMsgs = {}
      return RemovedMsgs
    end
  },
  New = function(Class, TimerKey, ChannelType)
    local NewObj = {}
    setmetatable(NewObj, Class)
    NewObj.ViewList = {}
    NewObj.RemovedMsgs = {}
    NewObj.TimerKey = TimerKey
    NewObj.ChannelType = ChannelType
    NewObj.MsgCache = ""
    return NewObj
  end
}
return {MessageWrap = MessageWrap, MessageList = MessageList}
