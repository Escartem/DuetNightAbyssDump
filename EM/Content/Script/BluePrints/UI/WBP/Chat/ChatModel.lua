local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local ChatMessage = require("BluePrints.UI.WBP.Chat.ChatMessage")
local MessageList = ChatMessage.MessageList
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  M.Super.Init(self)
  self._CurrentChannel = ChatCommon.ChannelDef.Public
  self._CachedMainUISize = nil
  self._CachedMainUIPos = nil
  self._OriginMainUISize = nil
  self._OriginMainUIPos = nil
  self._MessageDict = {}
  for ChannelName, ChannelType in pairs(ChatCommon.ChannelDef) do
    self._MessageDict[ChannelType] = MessageList:New(ChatCommon.ReddotNamePre .. ChannelName .. "_ChannelCD")
  end
  self._CurrentFriendUid = nil
  self:InitReddotCount()
  self.SimpleChatOutAnimCurve = LoadObject("CurveFloat'/Game/UI/WBP/Common/VX/UIVX/Curve/Curve_InteractiveItem_PC.Curve_InteractiveItem_PC'")
  AddToRoot(self.SimpleChatOutAnimCurve)
  self.EnteredChannels = {}
  self:UpdateCurrentChannel()
end

function M:IsChannelExclude(ChannelType)
  return self:GetAvatar().ChatChannelClose[ChannelType]
end

function M:Destory()
  for ChannelName, ChannelType in pairs(ChatCommon.ChannelDef) do
    self._MessageDict[ChannelType]:ClearMessage()
  end
  self._MessageDict = {}
  self._CurrentFriendUid = nil
  self._CachedMainUISize = nil
  self._CachedMainUIPos = nil
  self._OriginMainUISize = nil
  self._OriginMainUIPos = nil
  self.EnteredChannels = {}
  self._CurrentChannel = ChatCommon.ChannelDef.Public
  RemoveFromRoot(self.SimpleChatOutAnimCurve)
  self.SimpleChatOutAnimCurve = nil
  M.Super.Destory(self)
end

function M:GetFriendChatDatas()
  return self:GetAvatar().Chats
end

function M:GetEmojiDatas()
  return self:GetAvatar().Emoticons
end

function M:GetQuickMsgDatas()
  return self:GetAvatar().QuickMessages
end

function M:HasEmojiGroup(GruopId)
  for _, Id in ipairs(self:GetEmojiDatas()) do
    if Id == GruopId then
      return true
    end
  end
  return false
end

function M:IsForbidChat()
  if self:GetAvatar().ForbidChatTime > TimeUtils.NowTime() then
    return true
  end
  return false
end

function M:SetCurrentChannel(ChannelType)
  self._CurrentChannel = ChannelType
end

function M:SetCurrentFriendUid(Uid)
  self._CurrentFriendUid = Uid
end

function M:GetCurrentFriendUid()
  return self._CurrentFriendUid
end

function M:UpdateCurrentChannel()
  local CurrChannel = self._CurrentChannel
  while self:IsChannelExclude(CurrChannel) do
    CurrChannel = CurrChannel + 1
    if CurrChannel > ChatCommon.ChannelDef.Friend then
      CurrChannel = ChatCommon.ChannelDef.TeamUp
    end
    if CurrChannel == self._CurrentChannel then
      break
    end
  end
  self._CurrentChannel = CurrChannel
  if self._CurrentChannel == ChatCommon.ChannelDef.SettlementOnline and GWorld:IsStandAlone() then
    self._CurrentChannel = ChatCommon.ChannelDef.Public
  end
end

function M:GetCurrentChannel()
  return self._CurrentChannel
end

function M:GetMainUISize()
  if not self._CachedMainUISize then
    self._CachedMainUISize = FVector2D(0, 0)
  end
  return self._CachedMainUISize
end

function M:GetMainUIPos()
  if not self._CachedMainUIPos then
    self._CachedMainUIPos = FVector2D(0, 0)
  end
  return self._CachedMainUIPos
end

function M:InitOriginMainUITransform(Slot)
  if not self._OriginMainUISize then
    self._OriginMainUISize = Slot:GetSize()
    self:GetMainUISize()
    self._CachedMainUISize.X = self._OriginMainUISize.X
    self._CachedMainUISize.Y = self._OriginMainUISize.Y
  end
  if not self._OriginMainUIPos then
    self._OriginMainUIPos = Slot:GetPosition()
    self:GetMainUIPos()
    self._CachedMainUIPos.X = self._OriginMainUIPos.X
    self._CachedMainUIPos.Y = self._OriginMainUIPos.Y
  end
end

function M:ResetCachedMainUITransform()
  if not self._OriginMainUISize then
    return
  end
  self:GetMainUISize()
  self._CachedMainUISize.X = self._OriginMainUISize.X
  self._CachedMainUISize.Y = self._OriginMainUISize.Y
  if not self._OriginMainUIPos then
    return
  end
  self:GetMainUIPos()
  self._CachedMainUIPos.X = self._OriginMainUIPos.X
  self._CachedMainUIPos.Y = self._OriginMainUIPos.Y
end

function M:HasMainUIChanged()
  return self._CachedMainUISize.X ~= self._OriginMainUISize.X or self._CachedMainUISize.Y ~= self._OriginMainUISize.Y or self._CachedMainUIPos.X ~= self._OriginMainUIPos.X or self._CachedMainUIPos.Y ~= self._OriginMainUIPos.Y
end

function M:AddReddotCount(ChannelType, FriendUid)
  DebugPrint("ChatModel::AddReddotCount")
  if 1 == self:GetAvatar().ChatChannelMute[ChannelType] then
    DebugPrint("ChatModel::AddReddotCount, \232\129\138\229\164\169\233\162\145\233\129\147\232\162\171\229\177\143\232\148\189\239\188\140\228\184\141\230\183\187\229\138\160\231\186\162\231\130\185\228\186\134")
    return
  end
  if ChannelType ~= ChatCommon.ChannelDef.Friend then
    local NodeName = ChatCommon.ReddotNamePre .. ChatCommon.ChannelNames[ChannelType]
    local Node = ReddotManager.GetTreeNode(NodeName)
    if Node:GetNodeCount() < ChatCommon.ReddotMaxCount then
      ReddotManager.IncreaseLeafNodeCount(NodeName)
      ReddotManager.GetTreeNode(NodeName):UpdateParentsCount()
    end
  elseif FriendUid then
    local Chat = self:GetFriendChatDatas()[FriendUid]
    if not Chat then
      return
    end
    local NodeName = ChatCommon.ReddotNamePre .. FriendUid
    local Node = ReddotManager.GetTreeNode(NodeName)
    local AddValue = Chat:GetUnreadCount() - Node.Count
    if AddValue > 0 and Node:GetNodeCount() < ChatCommon.ReddotMaxCount then
      ReddotManager.IncreaseLeafNodeCount(NodeName, AddValue)
      ReddotManager.GetTreeNode(NodeName):UpdateParentsCount()
    end
  end
end

function M:ClearReddotCount(ChannelType, FriendUid)
  ChannelType = ChannelType or self._CurrentChannel
  if ChannelType ~= ChatCommon.ChannelDef.Friend then
    local NodeName = ChatCommon.ReddotNamePre .. ChatCommon.ChannelNames[ChannelType]
    ReddotManager.ClearLeafNodeCount(NodeName, true)
  else
    local NodeName = ChatCommon.ReddotNamePre .. FriendUid
    ReddotManager.ClearLeafNodeCount(NodeName, true)
  end
end

function M:AddFriendReddotNode(Uid, bAppendParent)
  DebugPrint(LXYTag, "Chat  \230\150\176\231\154\132\229\165\189\229\143\139\231\186\162\231\130\185\230\183\187\229\138\160\239\188\140Uid:", Uid)
  if nil == bAppendParent then
    bAppendParent = true
  end
  local Key = ChatCommon.ReddotNamePre .. Uid
  local Node = ReddotManager.AddNodeEx(Key, nil, 1, EReddotType.Num)
  ReddotManager.ClearLeafNodeCount(Key)
  local Chat = self:GetFriendChatDatas()[Uid]
  if Chat and Chat:GetUnreadCount() > 0 then
    ReddotManager.IncreaseLeafNodeCount(Key, Chat:GetUnreadCount())
  end
  local ParentNodeName = ChatCommon.ReddotNamePre .. ChatCommon.ChannelNames[ChatCommon.ChannelDef.Friend]
  if bAppendParent and not ReddotManager.GetTreeNode(ParentNodeName) then
    ReddotManager.AddNodeEx(ParentNodeName, {
      [Key] = {}
    }, 1)
    ReddotManager.AddNodeEx(ChatCommon.ReddotName, {
      [ParentNodeName] = {}
    })
  end
  return Node
end

function M:InitReddotCount()
  local ChildNodes = {}
  for ChannelName, ChannelType in pairs(ChatCommon.ChannelDef) do
    local NodeName = ChatCommon.ReddotNamePre .. ChannelName
    if ChannelType ~= ChatCommon.ChannelDef.Friend then
      ReddotManager.AddNodeEx(NodeName, nil, 1, EReddotType.Num)
      ReddotManager.ClearLeafNodeCount(NodeName)
      ChildNodes[NodeName] = {}
    else
      local FriendChildNodes = {}
      for Uid, _ in pairs(self:GetAvatar().Friends) do
        local Node = self:AddFriendReddotNode(Uid, false)
        FriendChildNodes[Node.Name] = {}
      end
      if next(FriendChildNodes) ~= nil then
        ReddotManager.AddNodeEx(NodeName, FriendChildNodes)
        ChildNodes[NodeName] = {}
      end
    end
  end
  if next(ChildNodes) ~= nil then
    ReddotManager.AddNodeEx(ChatCommon.ReddotName, ChildNodes)
  end
end

function M:AddMessage(Message, bCalcUnread)
  DebugPrint("ChatModel::AddMessage", self._CurrentChannel, self._CurrentFriendUid)
  local ChannelType = Message.ChannelType
  DebugPrint("ChatModel::AddMessage", bCalcUnread)
  if bCalcUnread then
    self:AddReddotCount(ChannelType, Message.Sender.Uid)
  end
  if self._CurrentFriendUid and Message.Type == CommonConst.MESSAGE_TYPE_PRIVATE then
    bCalcUnread = true
    local FriendUid = Message.Sender.Uid
    if Message.Sender.Uid == GWorld:GetAvatar().Uid then
      FriendUid = Message.ReceiverUid
      bCalcUnread = false
    end
    if ChannelType ~= self._CurrentChannel then
      return
    elseif self._CurrentFriendUid ~= FriendUid then
      if bCalcUnread then
        self:AddReddotCount(ChannelType, FriendUid)
      end
      return
    end
  end
  DebugPrint("ChatMessage::AddMessage bUnread, " .. tostring(bCalcUnread))
  return self._MessageDict[ChannelType]:AddMessage(Message, bCalcUnread)
end

function M:GetCurrentMsgViewList()
  if self._CurrentChannel == ChatCommon.ChannelDef.Friend then
    local TargetChat = {
      Messages = {}
    }
    if self._CurrentFriendUid then
      TargetChat = self:GetFriendChatDatas()[self._CurrentFriendUid] or TargetChat
    else
      local FinalIndexies = {}
      for i = 0, DataMgr.GlobalConstant.ChatMsgCountInBattleMain.ConstantValue do
        local Newest
        for Uid, Chat in pairs(self:GetFriendChatDatas()) do
          if not self:GetAvatar().Friends[Uid] then
          elseif 0 == i then
            FinalIndexies[Uid] = Chat.Messages:Length()
          else
            local FinalIndex = FinalIndexies[Uid]
            if 0 == FinalIndex then
            else
              local Msg = Chat.Messages[FinalIndex]
              if not Newest or Newest.Time < Msg.Time then
                Newest = Msg
              end
            end
          end
        end
        if not Newest then
        else
          table.insert(TargetChat.Messages, Newest)
          local Uid = Newest.Sender.Uid
          if Uid == GWorld:GetAvatar().Uid then
            Uid = Newest.ReceiverUid
          end
          FinalIndexies[Uid] = FinalIndexies[Uid] - 1
        end
      end
      table.reverse(TargetChat.Messages)
    end
    self._MessageDict[self._CurrentChannel]:UpdateFromChat(TargetChat)
  end
  return self._MessageDict[self._CurrentChannel].ViewList
end

function M:GetChannelCDTimerKey(ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  return self._MessageDict[ChannelType].TimerKey
end

function M:GetChannelCDReaminTime(ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  return self._MessageDict[ChannelType].CDRemainTime
end

function M:GetChannelRemovedMsgs(ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  return self._MessageDict[ChannelType]:GetOnceRemovedMsgs()
end

function M:SetChannelCDRemainTime(RemainTime, ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  self._MessageDict[ChannelType].CDRemainTime = RemainTime
end

function M:SetChannelMsgCache(MsgCache, ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  if self._CurrentFriendUid and ChannelType == ChatCommon.ChannelDef.Friend then
    local Chat = self:GetFriendChatDatas()[self._CurrentFriendUid]
    if Chat then
      Chat:SetMsgCache(MsgCache)
    end
  end
  self._MessageDict[ChannelType].MsgCache = MsgCache
end

function M:GetChannelMsgCache(ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  if self._CurrentFriendUid and ChannelType == ChatCommon.ChannelDef.Friend then
    local Chat = self:GetFriendChatDatas()[self._CurrentFriendUid]
    if Chat then
      self:SetChannelMsgCache(Chat:GetMsgCache())
    end
  end
  return self._MessageDict[ChannelType].MsgCache
end

function M:GetChannelUnreadCount(ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  return self._MessageDict[ChannelType].UnreadCount
end

function M:GetChannelNewTipWrap(ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  return self._MessageDict[ChannelType].NewTipWrap
end

function M:ReadChannelMessage(ChannelType, Uid)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  self._MessageDict[ChannelType]:ReadMessage()
  self:ClearReddotCount(ChannelType, Uid)
end

function M:ClearMessage(ChannelType)
  if nil == ChannelType then
    ChannelType = self._CurrentChannel
  end
  return self._MessageDict[ChannelType]:ClearMessage()
end

function M:GetTeamForChat()
  local TeamData = TeamController:GetModel():GetTeam()
  if not GWorld:IsStandAlone() and TeamData then
    TeamData = CommonUtils.CopyTable(TeamData)
    local TeamDataBackup = TeamController:GetModel():GetTeamBackup()
    for j, Member2 in ipairs(TeamController:GetModel():GetTeam().Members or {}) do
      for i, Member in ipairs(TeamDataBackup and TeamDataBackup.Members or {}) do
        if Member.Nickname == Member2.Nickname then
          local NewMember = CommonUtils.CopyTable(Member)
          NewMember.Index = Member2.Index
          TeamData.Members[j] = NewMember
        end
      end
      if Member2.Nickname == GWorld:GetAvatar().Nickname and not TeamDataBackup then
        TeamData.Members[j] = GWorld:GetAvatar()
      end
    end
  end
  return TeamData
end

function M:IsInRegionOnline()
  return self:GetAvatar().IsInRegionOnline
end

return M
