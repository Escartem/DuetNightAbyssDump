local ChatModel = require("BluePrints.UI.WBP.Chat.ChatModel")
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local TimeUtils = require("Utils.TimeUtils")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local MiscUtils = require("Utils.MiscUtils")
local M = Class("BluePrints.Common.MVC.Controller")

function M:Init()
  M.Super.Init(self)
  EventManager:AddEvent(EventID.OnlineRegionChange, self, self.OnRegionChange)
  self.bTipIgnoreBattle = true
  if 0 == ChatModel:GetQuickMsgDatas():Length() then
    self:SendInitQuickMessage(CommonConst.SystemLanguage)
  end
end

function M:Destory()
  EventManager:RemoveEvent(EventID.OnlineRegionChange, self)
  for _, ChannelType in pairs(ChatCommon.ChannelDef) do
    local CdTimer = self:GetModel():GetChannelCDTimerKey(ChannelType)
    self:SendRequestLeaveChatChannel(ChannelType)
    self:StopTimer(CdTimer)
  end
  M.Super.Destory(self)
end

function M:OnRegionChange(OldState, NewState)
  if NewState == OldState then
    return
  end
  if false == NewState then
    ChatModel:ReadChannelMessage(ChatCommon.ChannelDef.Region)
  end
end

function M:GetModel()
  return ChatModel
end

function M:GetEventName()
  return EventID.ChatControllerEvent
end

function M:OpenView(WorldContex, bBattle)
  return M.Super.OpenView(self, WorldContex, ChatCommon.MainUIId, true, bBattle)
end

function M:GetView(WorldContex)
  return M.Super.GetView(self, WorldContex, ChatCommon.UIName)
end

function M:OverrideButtonSound(button, soundEvent, eventKey)
  button:TryOverrideSoundFunc(function()
    AudioManager(button):PlayUISound(button, soundEvent, eventKey, nil)
  end)
end

function M:SendChatToPlayer(Uid, ContentText)
  local ModContent = self:TryParseMyModSuitInfo(ContentText)
  if ModContent then
    ContentText = ModContent
  end
  local DyeShareContent = self:TryParseMyDyePlanInfo(ContentText)
  if DyeShareContent and not ModContent then
    ContentText = DyeShareContent
  end
  self:GetAvatar():ChatToPlayer(Uid, ContentText)
end

function M:RecvChatToPlayer(Uid, ContentText)
  if ChatModel:IsChannelExclude(ChatCommon.ChannelDef.Friend) then
    return
  end
  self:SendChatNewMsgRead()
end

function M:RecvChatChannelSwitch(ChannelType, bOff)
  local LastCurrChannel = ChatModel:GetCurrentChannel()
  ChatModel:UpdateCurrentChannel()
  local ChannelConf = DataMgr.Channel[ChannelType]
  local Msg
  if bOff then
    self:SendRequestLeaveChatChannel(ChannelType)
    self:ClearChannelReddot(ChannelType)
    Msg = string.format(GText("UI_Chat_ChannelClose_Toast"), GText(ChannelConf.Name))
  else
    self:SendRequestEnterChatChannel(ChannelType)
    Msg = string.format(GText("UI_Chat_ChannelOpen_Toast"), GText(ChannelConf.Name))
  end
  if Msg then
    self:ShowToast(Msg)
  end
  if IsValid(self:GetView()) then
    self:GetView():Close()
  else
    local bCloseCurrentChannel = ChannelType == LastCurrChannel
    self:NotifyEvent(ChatCommon.EventID.CloseChatChannel, bCloseCurrentChannel)
  end
end

function M:SendRequestEnterChatChannel(ChannelType)
  if nil == ChannelType then
    ChannelType = ChatModel:GetCurrentChannel()
  end
  if ChatModel:IsChannelExclude(ChannelType) then
    return
  end
  if not self:GetModel().EnteredChannels then
    DebugPrint(ErrorTag, "\229\133\182\228\187\150\230\168\161\229\157\151\229\136\157\229\167\139\229\140\150\229\164\177\232\180\165\229\175\188\232\135\180\232\129\138\229\164\169\230\168\161\229\157\151\229\136\157\229\167\139\229\140\150\232\191\155\232\161\140\228\184\141\228\184\139\229\142\187\239\188\140\232\191\153\228\184\141\230\152\175\232\129\138\229\164\169\231\154\132\233\151\174\233\162\152!!!!\231\156\139\231\156\139\228\184\138\232\190\185\230\156\137\230\178\161\230\156\137trace!!!!!!!")
    return
  end
  if not ChatCommon.WorldChannels[ChannelType] or self:GetModel().EnteredChannels[ChannelType] then
    self:RecvRequestEnterChatChannel(ErrorCode.RET_SUCCESS, ChannelType)
    return
  end
  if ChannelType == ChatCommon.ChannelDef.Region then
    self:RecvRequestEnterChatChannel(ErrorCode.RET_SUCCESS, ChannelType)
    return
  end
  self:GetAvatar():RequestEnterWorldChannel(ChannelType)
end

function M:RecvRequestEnterChatChannel(ErrCode, ChannelType)
  self:GetModel().EnteredChannels[ChannelType] = 1
  self:NotifyEvent(ChatCommon.EventID.EnterChatChannel, ErrCode, ChannelType)
end

function M:SendRequestLeaveChatChannel(ChannelType)
  self:GetModel().EnteredChannels[ChannelType] = nil
  if nil == ChannelType then
    ChannelType = ChatModel:GetCurrentChannel()
  end
  if not ChatCommon.WorldChannels[ChannelType] then
    return
  end
  if ChannelType ~= ChatCommon.ChannelDef.Region then
    self:GetAvatar():RequestLeaveWorldChannel(ChannelType)
  else
    self:GetModel():ClearReddotCount(ChannelType)
  end
end

function M:SendChatToWorld(ChannelType, ContentText)
  local ModContent = self:TryParseMyModSuitInfo(ContentText)
  if ModContent then
    ContentText = ModContent
  end
  local DyeShareContent = self:TryParseMyDyePlanInfo(ContentText)
  if DyeShareContent and not ModContent then
    ContentText = DyeShareContent
  end
  self:GetAvatar():ChatToWorld(ChannelType, ContentText)
end

function M:RecvChatToWorld(ChannelType, ContentText)
  if ChatModel:IsChannelExclude(ChannelType) then
    return
  end
  local FakeMessage = self:CreateFakeMsg(ContentText, CommonConst.MESSAGE_TYPE_SELF, ChannelType)
  local TimeWrap, MsgWrap = self:GetModel():AddMessage(FakeMessage, false)
  if FakeMessage.ChannelType == ChatModel:GetCurrentChannel() then
    self:NotifyEvent(ChatCommon.EventID.ChatMsgSent, TimeWrap, MsgWrap)
  end
end

function M:SendChatToTeam(ContentText)
  local ModContent = self:TryParseMyModSuitInfo(ContentText)
  if ModContent then
    ContentText = ModContent
  end
  local DyeShareContent = self:TryParseMyDyePlanInfo(ContentText)
  if DyeShareContent and not ModContent then
    ContentText = DyeShareContent
  end
  if not GWorld:IsStandAlone() then
    local PC = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    if IsValid(PC) then
      local SinglePC = PC:Cast(UE4.ASinglePlayerController)
      if IsValid(SinglePC) then
        SinglePC:ChatAll(ContentText)
        return
      end
    end
  end
  self:GetAvatar():ChatToTeam(ContentText)
end

function M:RecvChatToTeam(ContentText)
  if ChatModel:IsChannelExclude(ChatCommon.ChannelDef.InTeam) then
    return
  end
  local FakeMessage = self:CreateFakeMsg(ContentText, CommonConst.MESSAGE_TYPE_SELF, ChatCommon.ChannelDef.InTeam)
  local TimeWrap, MsgWrap = self:GetModel():AddMessage(FakeMessage, false)
  if FakeMessage.ChannelType == ChatCommon.ChannelDef.InTeam then
    self:NotifyEvent(ChatCommon.EventID.ChatMsgSent, TimeWrap, MsgWrap)
  end
end

function M:SendChatToSettlementOnline(ContentText)
  local ModContent = self:TryParseMyModSuitInfo(ContentText)
  if ModContent then
    ContentText = ModContent
  end
  local DyeShareContent = self:TryParseMyDyePlanInfo(ContentText)
  if DyeShareContent and not ModContent then
    ContentText = DyeShareContent
  end
  self:GetAvatar():ChatToSettlementOnline(ContentText)
end

function M:RecvChatToSettlementOnline(ContentText)
  if ChatModel:IsChannelExclude(ChatCommon.ChannelDef.SettlementOnline) then
    return
  end
  local FakeMessage = self:CreateFakeMsg(ContentText, CommonConst.MESSAGE_TYPE_SELF, ChatCommon.ChannelDef.SettlementOnline)
  local TimeWrap, MsgWrap = self:GetModel():AddMessage(FakeMessage, false)
  if FakeMessage.ChannelType == ChatCommon.ChannelDef.SettlementOnline then
    self:NotifyEvent(ChatCommon.EventID.ChatMsgSent, TimeWrap, MsgWrap)
  end
end

function M:SendMemberChangeTipsToTeam(MemberInfo, EventType)
  local TextMessage
  if EventType == TeamCommon.EventId.TeamOnAddPlayer then
    TextMessage = string.format(GText("UI_Chat_SbJoin"), MemberInfo.Nickname)
  elseif EventType == TeamCommon.EventId.TeamOnDelPlayer then
    TextMessage = string.format(GText("UI_Chat_SbLeave"), MemberInfo.Nickname)
  end
  if nil ~= TextMessage then
    self:RecvSystemInfoToTeam(TextMessage)
  end
end

function M:RecvSystemInfoToTeam(ContentText)
  local FakeMessage = self:CreateFakeMsg(ContentText, CommonConst.MESSAGE_TYPE_SYSTEM, ChatCommon.ChannelDef.InTeam)
  local TimeWrap, MsgWrap = self:GetModel():AddMessage(FakeMessage, false)
  if FakeMessage.ChannelType ~= ChatModel:GetCurrentChannel() then
    return
  end
  self:NotifyEvent(ChatCommon.EventID.ChatMsgRecv, TimeWrap, MsgWrap)
end

function M:SendChangeQuickMessage(Index, ContentText)
  self:GetAvatar():ChangeQuickMessage(Index, ContentText)
end

function M:SendInitQuickMessage(SystemLanguage)
  self:GetAvatar():InitQuickMessage(SystemLanguage)
end

function M:RecvChangeQuickMessage(Index)
  self:NotifyEvent(ChatCommon.EventID.QuickMsgChanged, Index)
end

function M:SendAddEmotion(GroupId)
  self:GetAvatar():AddEmotion(GroupId)
end

function M:RecvAddEmotion(GroupId)
  self:NotifyEvent(ChatCommon.EventID.EmotionAdded, GroupId)
end

function M:SendRemoveEmotion(EmotionId)
  self:GetAvatar():RemoveEmotion(EmotionId)
end

function M:RecvRemoveEmotion(EmotionId)
  self:NotifyEvent(ChatCommon.EventID.EmotionRemoved, EmotionId)
end

function M:SendChatNewMsgRead(CurrFriendUid)
  if self:GetModel():GetCurrentChannel() ~= ChatCommon.ChannelDef.Friend then
    ChatModel:ClearReddotCount(self.CurrChannel)
  end
  if not CurrFriendUid then
    CurrFriendUid = ChatModel:GetCurrentFriendUid()
    if nil == CurrFriendUid then
      return
    end
  end
  self:GetAvatar():ReadChat(CurrFriendUid)
end

function M:RecvChatNewMsgRead(Uid)
  if Uid ~= ChatModel:GetCurrentFriendUid() then
    return
  end
  ChatModel:ReadChannelMessage(ChatCommon.ChannelDef.Friend, Uid)
end

function M:TryParseMyModSuitInfo(MsgStr)
  local ModModel = ModController:GetModel()
  if ModModel:IsModSuitInfoMsg(MsgStr) then
    local ModModel = ModController:GetModel()
    local ModContent = ModModel:GenerateModSuitInfoMsg()
    return ModContent
  end
  return nil
end

function M:TryParseMyDyePlanInfo(MsgStr)
  local ModModel = ModController:GetModel()
  if ModModel:IsDyeShareInfoMsg(MsgStr) then
    local ModModel = ModController:GetModel()
    local DyeShareContent = ModModel:GenerateDyeShareMsg()
    return DyeShareContent
  end
  return nil
end

function M:HandleChatMessage(Message)
  if not self.bInited then
    return
  end
  if Message.Type == CommonConst.MESSAGE_TYPE_PRIVATE then
    Message.ChannelType = ChatCommon.ChannelDef.Friend
    if Message.Sender.Uid == GWorld:GetAvatar().Uid then
      Message.Type = CommonConst.MESSAGE_TYPE_SELF
    end
  end
  if ChatModel:IsChannelExclude(Message.ChannelType) then
    return
  end
  local TimeWrap, MsgWrap = self:GetModel():AddMessage(Message, true)
  if Message.ChannelType ~= ChatModel:GetCurrentChannel() then
    return
  end
  if Message.Type == CommonConst.MESSAGE_TYPE_SELF then
    self:NotifyEvent(ChatCommon.EventID.ChatMsgSent, TimeWrap, MsgWrap)
  else
    self:NotifyEvent(ChatCommon.EventID.ChatMsgRecv, TimeWrap, MsgWrap)
  end
end

function M:CreateFakeMsg(ContentText, MsgType, Channel)
  return {
    Content = ContentText,
    Time = TimeUtils.NowTime(),
    Sender = self:GetAvatar(),
    Type = MsgType,
    ChannelType = Channel
  }
end

function M:SelectPlayerToChat(Uid)
  self:GetModel():SetCurrentFriendUid(Uid)
  self:NotifyEvent(ChatCommon.EventID.SelectPlayerToChat, Uid)
end

function M:OpenPlayerBtnList(WorldContext, AvatarInfo, FuncList)
  if not FuncList then
    return nil
  end
  local HeadOptionWidget = UIManager(WorldContext):_CreateWidgetNew(DataMgr.WidgetUI.ChatHeadOption.UIName)
  HeadOptionWidget:Init(AvatarInfo, FuncList)
  HeadOptionWidget.Owner = WorldContext
  return HeadOptionWidget
end

function M:OnMainClose(bBattle)
  ChatModel:SetCurrentFriendUid(nil)
  self:NotifyEvent(ChatCommon.EventID.CloseMainView, bBattle)
end

function M:OnMainOpen(bBattle)
  self:NotifyEvent(ChatCommon.EventID.OpenMainView, bBattle)
end

function M:CheckTextValid(Text, Callback, ShowTipFunc, TextMap, bAllowEmpty)
  if ModController:GetModel():IsModSuitInfoMsg(Text) then
    Callback(true, Text)
    return
  end
  if ModController:GetModel():IsDyeShareInfoMsg(Text) then
    Callback(true, Text)
    return
  end
  local EmptyHint = GText("UI_Chat_NotEmptyText")
  local BannedHint = GText("UI_REGISTER_BANNEDINPUT")
  if TextMap then
    EmptyHint = TextMap.EmptyHint or EmptyHint
    BannedHint = TextMap.BannedHint or BannedHint
  end
  local OldText = Text
  Text = MiscUtils.Trim(Text)
  if nil ~= OldText and "" == Text then
    ShowTipFunc(true, EmptyHint)
    return
  end
  if ("" == Text or nil == Text) and not bAllowEmpty then
    ShowTipFunc(true, EmptyHint)
    return
  end
  if string.match(Text, "<(.-)>(.-)</>") then
    ShowTipFunc(false, BannedHint)
    Callback(false)
    return
  end
  for GroupId, Id in string.gmatch(Text, "%[(%d+)|([%w]+)%]") do
    GroupId = tonumber(GroupId) or nil
    if GroupId and not DataMgr.EmojiGroup[GroupId] then
    elseif GroupId ~= ChatCommon.EmojiGroupId then
      ShowTipFunc(false, BannedHint)
      Callback(false)
      return
    end
  end
  if ChatCommon.IgnoreSensitiveCheck then
    Callback(true, Text)
    return
  end
  HeroUSDKUtils.CheckStringSensitive(GWorld.GameInstance, Text, function(self, ReplaceName, NewText, Words)
    ShowTipFunc(false, BannedHint)
    Callback(false)
  end, function(self, NewText)
    Callback(true, Text)
  end)
end

function M:OpenForbidChatDialog(Time, Reason, TimeDelta)
  local View = self:GetView()
  if not IsValid(View) then
    return
  end
  if nil == Time then
    Time = self:GetAvatar().ForbidChatTime
  end
  if nil == Reason then
    Reason = self:GetAvatar().ForbidChatReason
  end
  local timeDifference = TimeDelta and TimeDelta or Time - TimeUtils.NowTime()
  local days = math.floor(timeDifference / 86400)
  local hours = math.floor(timeDifference % 86400 / 3600)
  local minutes = math.floor(timeDifference % 3600 / 60)
  local Params = {
    ShortText = string.format(GText("UI_COMMONPOP_TEXT_100111"), days, hours, minutes)
  }
  self:GetUIMgr(View):ShowCommonPopupUI(ChatCommon.ForbidChatDialog, Params, View)
end

function M:OpenChatReportDialog(Params)
  local View = self:GetView()
  if not IsValid(View) then
    return
  end
  self:GetUIMgr(View):ShowCommonPopupUI(ChatCommon.AccuseDialog, Params, View)
end

function M:SetUpSendCDTimer(ChannelType)
  local CdTimer = self:GetModel():GetChannelCDTimerKey(ChannelType)
  self:StopTimer(CdTimer)
  local RawCDRemainTime = DataMgr.Channel[ChannelType].MessageCD
  if 0 == RawCDRemainTime then
    RawCDRemainTime = ChatCommon.DefaultCD
  end
  ChatModel:SetChannelCDRemainTime(RawCDRemainTime, ChannelType)
  local Interval = RawCDRemainTime < 1 and RawCDRemainTime or 1
  self:AddTimer(Interval, function()
    local CDRemianTime = ChatModel:GetChannelCDReaminTime(ChannelType) - Interval
    ChatModel:SetChannelCDRemainTime(CDRemianTime, ChannelType)
    if ChannelType == ChatModel:GetCurrentChannel() then
      self:NotifyEvent(ChatCommon.EventID.SendCDTimerUpdate, CDRemianTime)
    end
    if CDRemianTime <= 0 then
      self:StopTimer(CdTimer)
    end
  end, true, 0, CdTimer)
  if ChannelType == ChatModel:GetCurrentChannel() then
    self:NotifyEvent(ChatCommon.EventID.SendCDTimerUpdate, RawCDRemainTime)
  end
end

function M:IsSendCDTimerExist(ChannelType)
  local CdTimer = self:GetModel():GetChannelCDTimerKey(ChannelType)
  DebugPrint("ChatController :: IsSendCdTimerExist CdTimer = " .. CdTimer)
  return self:IsExistTimer(CdTimer)
end

function M:ParseEmojiToText(MsgWrap)
  local Content = MsgWrap.Message.Content
  if #MsgWrap.EmojiInfos > 0 then
    if MsgWrap:IsSticker() then
      local GroupId = MsgWrap.EmojiInfos[1].GroupId
      local Id = MsgWrap.EmojiInfos[1].Id
      local Error = "Error!!!"
      local EmojiGroupName = DataMgr.EmojiGroup[GroupId].Name or Error
      local EmojiName = DataMgr.ChatEmoji[GroupId][Id].Name or Error
      Content = string.format("[%s|%s]", GText(EmojiGroupName), GText(EmojiName))
    else
      local originalContent = Content
      for _, emojiInfo in ipairs(MsgWrap.EmojiInfos) do
        local GroupId = emojiInfo.GroupId
        local Id = emojiInfo.Id
        local EmojiName = DataMgr.ChatEmoji[GroupId][Id].Name or "Error!!!"
        local EmojiPattern = string.format("%%[%s|%s%%]", GroupId, GText(EmojiName))
        local EmojiReplacement = string.format("[%s]", GText(EmojiName))
        originalContent = originalContent:gsub(EmojiPattern, EmojiReplacement, 1)
      end
      Content = originalContent
    end
  end
  return Content
end

function M:ParseSpeakerHeader(MsgWrap)
  local Message = MsgWrap.Message
  local YouTo = ""
  local RichTextTag = ChatCommon.RichTextTag.Self
  local FriendName = GText("UI_Chat_You")
  if Message.ChannelType == ChatCommon.ChannelDef.Friend then
    YouTo = MsgWrap.MsgType == ChatCommon.MsgType.Self and GText("UI_Chat_YouTo") or ""
    RichTextTag = ChatCommon.RichTextTag.Friend
    local Uid = Message.Sender.Uid
    if MsgWrap.MsgType == ChatCommon.MsgType.Self then
      Uid = Message.ReceiverUid
    end
    FriendName = FriendController:GetModel():GetFriendDict()[Uid].Info.Nickname
  elseif MsgWrap.MsgType ~= ChatCommon.MsgType.Self then
    local Friend = FriendController:GetModel():GetFriendDict()[Message.Sender.Uid]
    RichTextTag = Friend and ChatCommon.RichTextTag.Friend or ChatCommon.RichTextTag.Stranger
    FriendName = Friend and Friend.Info.Nickname or Message.Sender.Nickname
  end
  local Spacker = string.format("%s<%s>%s</>%s", YouTo, RichTextTag, FriendName, ChatCommon.Spliter)
  local RawSpacker = table.concat({
    YouTo,
    FriendName,
    ChatCommon.Spliter
  })
  return Spacker, RawSpacker
end

function M:GetRawContent(MsgWrap)
  local Spacker, RawSpacker = self:ParseSpeakerHeader(MsgWrap)
  local Content = self:ParseEmojiToText(MsgWrap)
  return RawSpacker .. Content
end

function M:ParseModSuitText(MsgWrap)
  local Content = MsgWrap.Message.Content
  if not MsgWrap.ModSuitInfo then
    return Content
  end
  local TargetType = MsgWrap.ModSuitInfo.TargetInfo[1]
  local TargetId = MsgWrap.ModSuitInfo.TargetInfo[2]
  local Name = "\232\167\146\232\137\178\230\136\150\230\173\166\229\153\168\232\162\171\229\136\160\233\153\164\228\186\134!!!!"
  local Conf = DataMgr[TargetType][TargetId]
  if "Char" == TargetType then
    Name = Conf.CharName
  else
    Name = Conf.WeaponName
  end
  return string.format(GText("UI_Chat_ModSuitFormat"), GText(Name))
end

function M:ParseDyePlanText(MsgWrap)
  local Content = MsgWrap.Message.Content
  if not MsgWrap.DyePlanInfo then
    return Content
  end
  if not MsgWrap.DyePlanInfo.TargetName then
    return Content
  end
  local Name = MsgWrap.DyePlanInfo.TargetName
  return string.format(GText("UI_Chat_DyeSuitFormat"), GText(Name))
end

function M:ClearChannelReddot(ChannelType)
  if ChannelType ~= ChatCommon.ChannelDef.Friend then
    self:GetModel():ClearReddotCount(ChannelType)
  else
    for _, Friend in pairs(FriendController:GetModel():GetFriendDict()) do
      self:GetModel():ClearReddotCount(ChannelType, Friend.Uid)
      self:SendChatNewMsgRead(Friend.Uid)
    end
  end
end

_G.ChatController = M
return M
