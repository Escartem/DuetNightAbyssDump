require("UnLua")
local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local ChatModel = ChatController:GetModel()
local FriendModel = FriendController:GetModel()
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  M.Super.Construct(self)
  self.bBtnDragPressed = false
  self.bBtnTabPressed = false
  self.CurrSelectPlayer = nil
  self.MinWidth = self.Group_Panel.MinDesiredWidth
  self.MinHeight = self.Group_Panel.MinDesiredHeight
  self.Text_NewMassageDesc:SetText(GText("UI_Chat_BackToBottom"))
  self.Btn_Empty.OnClicked:Add(self, self.BtnEmptyOnClicked)
  self.Btn_Face:BindEventOnPressed(self, self.BtnfaceOnPressed)
  self.Btn_Face:BindEventOnReleased(self, self.BtnFaceOnReleased)
  self.Btn_NewMessage.OnClicked:Add(self, self.BtnNewMsgOnClicked)
  self.Btn_QuickReply:BindEventOnPressed(self, self.BtnQuickReplyOnPressed)
  self.Btn_QuickReply:BindEventOnReleased(self, self.BtnQuickReplyOnReleased)
  self.Btn_Sent:SetText(GText("UI_Chat_Send"))
  self.List_Dialog:DisableScroll(true)
  self.List_Dialog.BP_OnEntryGenerated:Add(self, function(self, Widget)
    if not self._DialogItemCounter then
      self._DialogItemCounter = 0
    end
    if not self._TotalHeight then
      self._TotalHeight = 0
    end
    Widget.Content.ScrollOffset = self._TotalHeight
    self._TotalHeight = self._TotalHeight + Widget:GetDesiredSize().Y
    self._DialogItemCounter = self._DialogItemCounter + 1
    if self._DialogItemCounter >= self.List_Dialog:GetListItems():Num() then
      if Widget.Content.Data.MsgType == ChatCommon.MsgType.Self or not self.bDialogListRefreshed then
        self.Group_NewMessage:SetVisibility(UIConst.VisibilityOp.Collapsed)
        self:_AutoScrollToEnd()
      end
      if Widget.Content.Data.MsgType ~= ChatCommon.MsgType.Self then
        self:_ReduceOverflowMessage()
      end
      self.MaxScrollOffset = self.SB_Dialog:GetScrollOffsetOfEnd()
      self.SB_Dialog:SetAlwaysShowScrollbar(self.CurInputDeviceType == ECommonInputType.Gamepad and self.MaxScrollOffset > 0)
      if self.bDialogListRefreshed then
        local NewMsgCount = ChatModel:GetChannelUnreadCount()
        local Visibility = NewMsgCount > 0 and "SelfHitTestInvisible" or "Collapsed"
        if self.SB_Dialog:GetScrollOffset() + 50 >= self.MaxScrollOffset then
          Visibility = "Collapsed"
          ChatController:SendChatNewMsgRead()
        end
        if Widget.Content.Data.MsgType == ChatCommon.MsgType.Self then
          Visibility = "Collapsed"
        end
        self.Group_NewMessage:SetVisibility(UIConst.VisibilityOp[Visibility])
      end
      self:UpdateUIStyleInPlatform()
      self.bDialogListRefreshed = true
    end
  end)
  self.SB_Dialog.OnUserScrolled:Add(self, function(self, CurrScrollOffset)
    if CurrScrollOffset >= self.SB_Dialog:GetScrollOffsetOfEnd() then
      self:BtnNewMsgOnClicked(true)
    elseif CurrScrollOffset + 50 < self.MaxScrollOffset then
      self.Group_NewMessage:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end)
  self.PanelAnchor.OnGetMenuContentEvent:Bind(self, self.OnCreatePanel)
  self.PanelAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  self.PanelAnchor_Face.OnGetMenuContentEvent:Bind(self, self.OnCreatePanel)
  self.PanelAnchor_Face.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  self.CurrExtraPanel = nil
  self.CurrExtraPanelName = ""
  self.MaxScrollOffset = 0
end

function M:_Stop_SetUpChatMsgListTimer()
  if self:IsExistTimer(self._SetUpChatMsgListTimer) then
    self:RemoveTimer(self._SetUpChatMsgListTimer)
    self.SB_Dialog:DisableDrag(false)
    self.SB_Dialog:SetRenderOpacity(1)
  end
end

function M:_SetUpChatMsgList()
  self:_Stop_SetUpChatMsgListTimer()
  self.bDialogListRefreshed = false
  self._TotalHeight = 0
  self._DialogItemCounter = 0
  self.List_Dialog:ClearListItems()
  self.WS_Dialoglist:SetActiveWidgetIndex(0)
  local MsgList = ChatModel:GetCurrentMsgViewList()
  self._SetUpChatMsgListIndex = 0
  self.SB_Dialog:ScrollToStart()
  self.SB_Dialog:DisableDrag(true)
  self.SB_Dialog:SetRenderOpacity(0)
  local _, TimerKey = self:AddTimer(0.01, self._SetUpChatMsgListTimerCallback, true, 0, nil, true, MsgList)
  self._SetUpChatMsgListTimer = TimerKey
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self._ChatItemList = {}
  end
end

function M:OpenDisturbWindows()
  local Parms = {
    RightCallbackFunction = function()
      EventManager:FireEvent(EventID.ComfirmDisturbClick)
    end,
    OnCloseCallbackObj = self,
    OnCloseCallbackFunction = self.FreshTabDisturbIcon,
    RightGamepadImg = "X",
    AutoFocus = true
  }
  UIManager(self):ShowCommonPopupUI(100193, Parms, self)
end

function M:BtnEmptyOnClicked()
  if self.CurrChannel == ChatCommon.ChannelDef.InTeam then
    self:HandleGoToTeamType()
  elseif self.CurrChannel == ChatCommon.ChannelDef.Friend then
    local View = FriendController:OpenView(self, FriendCommon.FriendTabType.AddFriend)
    if not IsValid(View) then
      ChatController:ShowToast(GText("UI_Chat_CannotOpenFriend"))
    end
    self:Close()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
end

function M:BtnNewMsgOnClicked(bMuteSound)
  self:_AutoScrollToEnd()
  self.Group_NewMessage:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if not bMuteSound then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
  end
end

function M:BtnfaceOnPressed()
  local ChatEmoji = DataMgr.WidgetUI.ChatEmoji.UIName
  if self.CurrExtraPanelName ~= ChatEmoji then
    self.CurrExtraPanelName = ChatEmoji
  else
    self.CurrExtraPanelName = ""
  end
end

function M:BtnFaceOnReleased()
  local ChatEmoji = DataMgr.WidgetUI.ChatEmoji.UIName
  if self.CurrExtraPanelName == ChatEmoji then
    self.PanelAnchor_Face:Open(true)
  elseif self.IsOpenMenu then
    self.PanelAnchor_Face:Close()
  end
end

function M:BtnQuickReplyOnPressed()
  local ChatQuickMsg = DataMgr.WidgetUI.ChatQuickMsg.UIName
  if self.CurrExtraPanelName ~= ChatQuickMsg then
    self.CurrExtraPanelName = ChatQuickMsg
  else
    self.CurrExtraPanelName = ""
  end
end

function M:BtnQuickReplyOnReleased()
  local ChatQuickMsg = DataMgr.WidgetUI.ChatQuickMsg.UIName
  if self.CurrExtraPanelName == ChatQuickMsg then
    self.PanelAnchor:Open(true)
  elseif self.IsOpenMenu then
    self.PanelAnchor:Close()
  end
end

function M:BtnSendOnClicked(bSkipCheck)
  self.Com_Input:FocusInputField()
  if self.CurrChannel == ChatCommon.ChannelDef.Friend and not ChatModel:GetCurrentFriendUid() then
    ChatController:ShowToast(GText("UI_Chat_SelectAFriend"))
    return
  end
  if ChatModel:IsForbidChat() then
    ChatController:OpenForbidChatDialog()
    return
  end
  if ChatController:IsSendCDTimerExist(self.CurrChannel) then
    ChatController:ShowToast(GText("UI_Chat_SendTooFast"))
    return
  end
  if self.Com_Input:GetText() == "" then
    self.Com_Input:ShowTips(GText("UI_Chat_NotEmptyText"), 2)
    return
  end
  if not self.Btn_Sent:IsForbidden() then
    AudioManager(self):PlayUISound(self, "event:/ui/common/team_click_send_msg", nil, nil)
    self.Btn_Sent:SetForbidden()
  else
    return
  end
  if bSkipCheck then
    self:_SendChatMsg(self.Com_Input:GetText())
    return
  end
  ChatController:CheckTextValid(self.Com_Input:GetText(), function(bValid, MsgText)
    if not bValid then
      self.Btn_Sent:SetNormal()
      return
    end
    self:_SendChatMsg(MsgText)
  end, function(bWarning, TipText)
    self.Com_Input:ShowTips(TipText, bWarning and 2 or 1, bWarning and 1.5 or 0)
  end)
  if self.PanelAnchor:IsOpen() then
    self.PanelAnchor:Close()
  end
  if self.PanelAnchor_Face:IsOpen() then
    self.PanelAnchor_Face:Close()
  end
end

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  local bBattle = (...)
  if type(bBattle) == "table" then
    self.bBattle = bBattle.bBattle
    self.bInDungeonSettlement = bBattle.bInDungeonSettlement
  else
    self.bBattle = bBattle
  end
  self.OriginBlurStrength = self.BackgroundBlur_50.BlurStrength
  local BlurStrength = self.bBattle and 0 or self.OriginBlurStrength
  self.BackgroundBlur_50:SetBlurStrength(BlurStrength)
  ChatController:OnMainOpen(self.bBattle)
  AudioManager(self):PauseObjectAllEvent(self, false)
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_msg_panel_open", "ChatMainPC", nil)
end

function M:_SendChatMsg(MsgText)
  if self.CurrChannel == ChatCommon.ChannelDef.TeamUp then
    ChatController:SendChatToWorld(self.CurrChannel, MsgText)
  elseif self.CurrChannel == ChatCommon.ChannelDef.Public then
    ChatController:SendChatToWorld(self.CurrChannel, MsgText)
  elseif self.CurrChannel == ChatCommon.ChannelDef.Region then
    ChatController:SendChatToWorld(self.CurrChannel, MsgText)
  elseif self.CurrChannel == ChatCommon.ChannelDef.InTeam then
    ChatController:SendChatToTeam(MsgText)
  elseif self.CurrChannel == ChatCommon.ChannelDef.Friend then
    ChatController:SendChatToPlayer(ChatModel:GetCurrentFriendUid(), MsgText)
  elseif self.CurrChannel == ChatCommon.ChannelDef.SettlementOnline then
    ChatController:SendChatToSettlementOnline(MsgText)
  end
end

function M:OnCreatePanel()
  self.CurrExtraPanel = self:CreateWidgetNew(self.CurrExtraPanelName)
  return self.CurrExtraPanel
end

function M:OnMenuOpenChanged(bOpen)
  if self.RefreshUIWithMenuChanged then
    self:RefreshUIWithMenuChanged(bOpen)
  end
  if bOpen then
    self.CurrExtraPanel:Open(self, self.CurrExtraPanelName)
  else
    self.CurrExtraPanel:Close()
  end
end

function M:ApplyEmoji(EmojiData)
  local EmojiText = string.format("[%s|%s]", EmojiData.GroupId, EmojiData.Id)
  local EmojiTextShow = string.format("[%s]", EmojiData.Id)
  local Text = self.Com_Input:GetText()
  if EmojiData.GroupId == ChatCommon.EmojiGroupId then
    self.Com_Input:InsertText(EmojiTextShow)
  else
    self.Com_Input:SetText(EmojiText)
    self:BtnSendOnClicked(true)
    self.Com_Input:SetText(Text)
    self.PanelAnchor_Face:Close()
  end
end

function M:ApplyQuickMsg(QuickMsgText)
  local Text = self.Com_Input:GetText()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Com_Input:SetText(QuickMsgText)
    self:BtnSendOnClicked(true)
    self.Com_Input:SetText(Text)
    self.PanelAnchor:Close()
  else
    self.Com_Input:SetText(Text .. QuickMsgText)
    self.PanelAnchor:Close()
  end
end

function M:OnExtraPanelClose()
  self.Com_Input:FocusInputField()
  if self.CurrExtraPanelName == self.CurrExtraPanel.ViewName then
    self.CurrExtraPanelName = ""
  end
  self.CurrExtraPanel = nil
  self:TryToDefaultFocusWidget()
end

function M:OnTabSelected_TeamUp(TabWidget, TabItemInfo)
  self:HandleEnterChatChannel(ErrorCode.RET_SUCCESS, ChatCommon.ChannelDef.TeamUp)
  self:_SetUpBtnSentState()
end

function M:OnTabSelected_Friend(TabWidget, TabItemInfo)
  self.Group_ChatEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_ChatNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_PlayerList:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_BottomNormal:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_BottomEmpty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_DialogEmptyText:SetText(GText("UI_Chat_SelectAFriend"))
  self.WS_Dialoglist:SetActiveWidgetIndex(1)
  self.Text_PlayerListTitle:SetText(GText("UI_Friend_MyFriend"))
  self.List_Player:ClearListItems()
  self.Btn_Sent:SetForbidden()
  FriendController:SendRequest(FriendCommon.EventId.RefreshFriend)
end

function M:OnTabSelected_Public(TabWidget, TabItemInfo)
  self:HandleEnterChatChannel(ErrorCode.RET_SUCCESS, ChatCommon.ChannelDef.Public)
  self:_SetUpBtnSentState()
end

function M:OnTabSelected_Region(TabWidget, TabItemInfo)
  self:HandleEnterChatChannel(ErrorCode.RET_SUCCESS, ChatCommon.ChannelDef.Region)
  self:_SetUpBtnSentState()
end

function M:OnTabSelected_SettlementOnline(TabWidget, TabItemInfo)
  self:HandleEnterChatChannel(ErrorCode.RET_SUCCESS, ChatCommon.ChannelDef.SettlementOnline)
  self:_SetUpBtnSentState()
  self:_SetUpChatMsgList()
end

function M:OnTabSelected_League(TabWidget, TabItemInfo)
  self:_SetUpFullEmpty(GText("UI_Chat_LeagueEmpty"), GText("UI_Chat_GotoLeague"))
end

function M:OnTabSelected_InTeam(TabWidget, TabItemInfo)
  local CurrentPlatform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "PC" == CurrentPlatform then
    self.Text_PlayerListTitle:SetText(GText("UI_Chat_TeammateList"))
    self.Group_PlayerList:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.List_Player:ClearListItems()
  end
  local TeamData = TeamController:GetModel():GetTeam()
  local TeamNumber = nil == TeamData and 0 or #TeamData.Members
  if 0 == TeamNumber then
    self:_SetUpFullEmpty(GText("UI_Chat_NoTeam"), GText("UI_Chat_GotoTeamUp"))
  else
    self.Group_BottomNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_BottomEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    ChatController:SendRequestEnterChatChannel()
    self:_SetUpBtnSentState()
  end
end

function M:AddReddotListen()
  for ChannelName, ChannelType in pairs(ChatCommon.ChannelDef) do
    self:_AddReddotListenInner(ChannelName, ChannelType)
  end
  self._bAddedReddotListen = true
end

function M:_AddReddotListenInner(ChannelName, ChannelType)
end

function M:RemoveReddotListen()
  if not self._bAddedReddotListen then
    return
  end
  for ChannelName, ChannelType in pairs(ChatCommon.ChannelDef) do
    local NodeName = ChatCommon.ReddotNamePre .. ChannelName
    if not ReddotManager.GetTreeNode(NodeName) then
      return
    end
    ReddotManager.RemoveListener(NodeName, self)
  end
end

function M:SetUpNewTipIndex(NewTipIndex)
  self._NewTipIndex = NewTipIndex
end

function M:_SetUpBtnSentState()
  if ChatController:IsSendCDTimerExist(self.CurrChannel) then
    self.Btn_Sent:SetForbidden()
    self:HandleSendCDTimerUpdate(ChatModel:GetChannelCDReaminTime(self.CurrChannel))
  end
end

function M:_SetUpMsgCache()
  local MsgCache = ChatModel:GetChannelMsgCache()
  self.Com_Input:SetText(MsgCache)
end

function M:_SetUpChatEmpty(Text, BtnText)
  self.Group_BottomNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_BottomEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_PlayerList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_ChatEmpty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_ChatNormal:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_ChatEmpry:SetText(Text)
  local Visibility = BtnText and "Visibility" or "Collapsed"
  self.Panel_Add:SetVisibility(UIConst.VisibilityOp[Visibility])
  if BtnText then
    self.Text_Recruit:SetText(BtnText)
  end
end

function M:_SetUpFullEmpty(Text, BtnText)
  self:_SetUpChatEmpty(Text, BtnText)
  self.Group_BottomNormal:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_BottomEmpty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:Close()
  if self.IsBeginToClose then
    return
  end
  AudioManager(self):SetEventSoundParam(self, "ChatMainPC", {ToEnd = 1})
  if self:IsAnimationPlaying(self.Auto_In) then
    return
  end
  ChatModel:SetChannelMsgCache(self.Com_Input:GetText())
  ChatController:OnMainClose(self.bBattle)
  M.Super.Close(self)
end

function M:_AddNewMsgToListView(MsgWrap)
  if not MsgWrap then
    return
  end
  if 0 == self.List_Dialog:GetNumItems() then
    self.WS_Dialoglist:SetActiveWidgetIndex(0)
  end
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.Owner = self
  Content.Data = MsgWrap
  self.List_Dialog:AddItem(Content)
end

function M:OnPlayerListUISelected(Content)
  if self.CurrSelectPlayer and Content ~= self.CurrSelectPlayer then
    self.CurrSelectPlayer.bSelected = false
    if IsValid(self.CurrSelectPlayer.UI) then
      self.CurrSelectPlayer.UI:UnSelect()
    end
  end
  local OldSelectPlayer = self.CurrSelectPlayer
  self.CurrSelectPlayer = Content
  local LastFriendUid = ChatModel:GetCurrentFriendUid()
  if OldSelectPlayer ~= self.CurrSelectPlayer and self.CurrChannel ~= ChatCommon.ChannelDef.InTeam then
    if LastFriendUid then
      ChatModel:SetChannelMsgCache(self.Com_Input:GetText())
    end
    ChatModel:SetCurrentFriendUid(Content.Data.Uid)
    self.Group_BottomEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_BottomNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:_SetUpChatMsgList()
    self:_SetUpMsgCache()
    if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
      self.Com_Input:FocusInputField()
    end
  end
  if self.IsOpenHead then
    self:UpdateUIStyleInPlatform()
  end
end

function M:HandleChatMsgRecv(TimeWrap, MsgWrap)
  if self.CurrChannel == ChatCommon.ChannelDef.Friend and not ChatModel:GetCurrentFriendUid() then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_msg_pop", nil, nil)
  self:_AddNewMsgToListView(TimeWrap)
  self:_AddNewMsgToListView(MsgWrap)
end

function M:HandleChatMsgSent(TimeWrap, MsgWrap)
  ChatController:SetUpSendCDTimer(MsgWrap.Message.ChannelType)
  if not MsgWrap:IsSticker() then
    self.Com_Input:SetText("")
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_msg_pop", nil, nil)
  self:_AddNewMsgToListView(TimeWrap)
  self:_AddNewMsgToListView(MsgWrap)
end

function M:_AutoScrollToEnd()
  self.SB_Dialog:EndInertialScrolling()
  self.SB_Dialog:ScrollToEnd()
  ChatController:SendChatNewMsgRead()
  self:_ReduceOverflowMessage()
end

function M:_ReduceOverflowMessage()
  if self:IsExistTimer(self.RemoveItemDelayTimer) then
    self:RemoveTimer(self.RemoveItemDelayTimer)
  end
  local RemovedMsgs = ChatModel:GetChannelRemovedMsgs()
  for i, Msg in ipairs(RemovedMsgs) do
    local Item = self.List_Dialog:GetItemAt(0)
    if Item then
      self._DialogItemCounter = self._DialogItemCounter - 1
      self.List_Dialog:RemoveItem(Item)
    end
  end
  self.RemoveItemDelayTimer = TimerKey
end

function M:HandleEnterChatChannel(ErrCode, ChannelType)
  if ChannelType ~= self.CurrChannel then
    return
  end
  if ErrCode == ErrorCode.RET_SUCCESS then
    FriendController:SendRequest(FriendCommon.EventId.RefreshFriend)
  elseif self.CurrChannel == ChatCommon.ChannelDef.TeamUp then
    self:_SetUpFullEmpty(GText("UI_Chat_InTeamEmpty"))
  elseif self.CurrChannel == ChatCommon.ChannelDef.Public then
    self:_SetUpFullEmpty(GText("UI_Chat_PublicEmpty"))
  elseif self.CurrChannel == ChatCommon.ChannelDef.InTeam then
    self:_SetUpFullEmpty(GText("UI_Chat_InTeamEmpty"))
  elseif self.CurrChannel == ChatCommon.ChannelDef.Region then
    self:_SetUpFullEmpty(GText("UI_Chat_RegionEmpty"))
  elseif self.CurrChannel == ChatCommon.ChannelDef.SettlementOnline then
    self:_SetUpFullEmpty(GText("UI_Chat_SettlementOnlineEmpty"))
  end
end

function M:HandleSendCDTimerUpdate(RemainTime)
  if RemainTime < 1 then
    self.Btn_Sent:SetText(GText("UI_Chat_Send"))
    if self.Com_Input:GetText() ~= "" then
      self.Btn_Sent:SetNormal()
    end
  else
    self.Btn_Sent:SetText(string.format(GText("UI_SHOP_REMAINTIME_SECOND"), RemainTime))
  end
end

function M:HandleRefreshFriend(ErrCode)
  if ErrCode ~= ErrorCode.RET_SUCCESS then
    return
  end
  local FriendChannel = ChatCommon.ChannelDef.Friend
  self:_AddReddotListenInner(ChatCommon.ChannelNames[FriendChannel], FriendChannel)
  if self.CurrChannel == ChatCommon.ChannelDef.Friend then
    self:_HandleRefreshFriendInPrivateChannel()
  elseif self.CurrChannel == ChatCommon.ChannelDef.TeamUp then
    self:_HandleRefreshFriendInOpenChannel()
  elseif self.CurrChannel == ChatCommon.ChannelDef.Public then
    self:_HandleRefreshFriendInOpenChannel()
  elseif self.CurrChannel == ChatCommon.ChannelDef.Region then
    self:_HandleRefreshFriendInRegionChannel()
  elseif self.CurrChannel == ChatCommon.ChannelDef.InTeam then
    self:_HandleRefreshTeamMateInTeamChannel()
  end
end

function M:_HandleRefreshFriendInRegionChannel()
  if ChatModel:IsInRegionOnline() then
    self:_HandleRefreshFriendInOpenChannel()
  else
    self:_SetUpFullEmpty(GText("UI_Chat_NotInOnlineRegion"))
  end
end

function M:Destruct()
  ChatController:UnRegisterEvent(self)
  FriendController:UnRegisterEvent(self)
  TeamController:UnRegisterEvent(self)
  self:RemoveReddotListen()
  self.Btn_Empty.OnClicked:Remove(self, self.BtnEmptyOnClicked)
  self.Btn_NewMessage.OnClicked:Remove(self, self.BtnNewMsgOnClicked)
  self.Btn_Face:UnBindEventOnReleased(self, self.BtnFaceOnReleased)
  self.Btn_Face:UnBindEventOnPressed(self, self.BtnfaceOnPressed)
  self.List_Dialog.BP_OnEntryGenerated:Clear()
  self.PanelAnchor.OnGetMenuContentEvent:Unbind()
  self.PanelAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  self.PanelAnchor_Face.OnGetMenuContentEvent:Unbind()
  self.PanelAnchor_Face.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  self.Btn_QuickReply:UnBindEventOnReleased(self, self.BtnQuickReplyOnReleased)
  self.Btn_QuickReply:UnBindEventOnPressed(self, self.BtnQuickReplyOnPressed)
  self.BackgroundBlur_50:SetBlurStrength(self.OriginBlurStrength)
  M.Super.Destruct(self)
end

function M:_HandleRefreshFriendInPrivateChannel()
  local NowCount, TotalCount = 0, DataMgr.GlobalConstant.FriendHoldMax.ConstantValue
  FriendModel:SortFriends(3, CommonConst.DESC)
  local FriendList = FriendModel:GetFriendList()
  local SelectedPlayerIndex
  for i, Value in ipairs(FriendList) do
    local FriendData = FriendModel:GetFriendDict()[Value]
    SelectedPlayerIndex = SelectedPlayerIndex or i - 1
    NowCount = NowCount + 1
    if ChatModel:GetCurrentFriendUid() == FriendData.Uid then
      SelectedPlayerIndex = i - 1
    end
  end
  self.List_Player:ClearListItems()
  for i, Value in ipairs(FriendList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Owner = self
    local FriendData = FriendModel:GetFriendDict()[Value]
    Content.Data = FriendData
    if SelectedPlayerIndex + 1 == i then
      Content.bSelected = true
    end
    self.List_Player:AddItem(Content)
  end
  self.SelectedPlayerIndex = SelectedPlayerIndex
  if SelectedPlayerIndex then
    self.List_Player:ScrollIndexIntoView(SelectedPlayerIndex + 1)
  end
  self.Text_PlayerNum:SetText(string.format("%d/%d", NowCount, TotalCount))
  if 0 == NowCount then
    local CurrentPlatform = CommonUtils.GetDeviceTypeByPlatformName(self)
    local ShowEmptyText = "PC" == CurrentPlatform and GText("UI_Friend_NoAnyFriend") or GText("UI_Friend_AddBeforeChat")
    self:_SetUpFullEmpty(ShowEmptyText, GText("UI_Friend_GoToAdd"))
    return
  end
  self.Com_Input:SetText("")
end

function M:_HandleRefreshFriendInOpenChannel()
  self.Group_ChatEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_ChatNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:_SetUpChatMsgList()
  self:_SetUpMsgCache()
end

function M:_HandleRefreshTeamMateInTeamChannel()
  local CurrentPlatform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "PC" == CurrentPlatform then
    local NowCount = self:RefreshTeamMemberListInPC()
    if 0 == NowCount then
      self:_SetUpFullEmpty(GText("UI_Chat_NoTeam"), GText("UI_Chat_GotoTeamUp"))
      return
    end
    self.Com_Input:SetText("")
  end
  self.Group_ChatEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_ChatNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:_SetUpChatMsgList()
  self:_SetUpMsgCache()
end

return M
