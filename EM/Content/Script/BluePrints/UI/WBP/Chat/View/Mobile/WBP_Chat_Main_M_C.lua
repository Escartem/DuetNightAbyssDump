require("UnLua")
local ChatModel = ChatController:GetModel()
local M = Class({
  "BluePrints.UI.WBP.Chat.View.WBP_Chat_MainBase_C"
})

function M:Construct()
  M.Super.Construct(self)
  self.Btn_CloseFull.OnClicked:Add(self, self.Close)
  self.Image_TabBG:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_ChatTabListEmpty:SetText(GText("UI_Friend_NoAnyFriend"))
  self.Button_Tab.OnClicked:Add(self, self.BtnTeamInfoOnClicked)
  self.Btn_Sent:BindOnClick(self, function(self)
    self:BtnSendOnClicked()
  end)
  self.Com_Input:Init({
    Owner = self,
    HintText = GText(GText("UI_Chat_InputHint")),
    TextLimit = DataMgr.GlobalConstant.ChatMsgMaxLen.ConstantValue,
    bLimitSpaces = true,
    Events = {
      OnTextChanged = function(self, Text)
        if "" == Text then
          self.Btn_Sent:SetForbidden()
        elseif self.Btn_Sent:IsForbidden() and not ChatController:IsSendCDTimerExist(self.CurrChannel) then
          self.Btn_Sent:SetNormal()
        end
        if self.Com_Input:Utf8StrLen(Text) > self.Com_Input.TextLimit then
          self.PanelAnchor:Close()
          self.PanelAnchor_Face:Close()
        end
      end,
      OnTextCommitted = function(self, Text, CommitType)
        if CommitType == ETextCommit.OnEnter then
          self:BtnSendOnClicked()
        end
      end
    }
  })
  ChatController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == ChatCommon.EventID.EnterChatChannel then
      local ErrCode, ChannelType = ...
      self:HandleEnterChatChannel(ErrCode, ChannelType)
    elseif EventId == ChatCommon.EventID.ChatMsgRecv then
      local TimeWrap, MsgWrap = ...
      self:HandleChatMsgRecv(TimeWrap, MsgWrap)
    elseif EventId == ChatCommon.EventID.ChatMsgSent then
      local TimeWrap, MsgWrap = ...
      self:HandleChatMsgSent(TimeWrap, MsgWrap)
    elseif EventId == ChatCommon.EventID.SelectPlayerToChat then
      local Uid = (...)
      self:HandleSelectPlayerToChat(Uid)
    elseif EventId == ChatCommon.EventID.SendCDTimerUpdate then
      local RemainTime = (...)
      self:HandleSendCDTimerUpdate(RemainTime)
    end
  end)
  FriendController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == FriendCommon.EventId.RefreshFriend then
      local ErrCode = (...)
      self:HandleRefreshFriend(ErrCode)
    elseif EventId == FriendCommon.EventId.AddBlackList then
      self:HandleAddBlackList()
    elseif EventId == FriendCommon.EventId.AddFriend then
      self:HandleRefreshFriend(ErrorCode.RET_SUCCESS)
    elseif EventId == FriendCommon.EventId.DeleteFriend then
      self:HandleRefreshFriend(ErrorCode.RET_SUCCESS)
    end
  end)
  TeamController:RegisterEvent(self, function(self, EventId, ...)
    if self.CurrChannel ~= ChatCommon.ChannelDef.InTeam then
      return
    end
    if EventId == TeamCommon.EventId.TeamOnAddPlayer then
      self:OnRefreshTeamChannelInfo(false)
    elseif EventId == TeamCommon.EventId.TeamOnDelPlayer then
      self:OnRefreshTeamChannelInfo(false)
    elseif EventId == TeamCommon.EventId.TeamOnInit then
      self:OnRefreshTeamChannelInfo(true)
    elseif EventId == TeamCommon.EventId.TeamLeave then
      self:OnRefreshTeamChannelInfo(true)
    elseif EventId == TeamCommon.EventId.DsTeamOnAddPlayer then
      self:OnRefreshTeamChannelInfo(false)
    elseif EventId == TeamCommon.EventId.DsTeamOnDelPlayer then
      self:OnRefreshTeamChannelInfo(false)
    end
  end)
  self.Btn_DontDisturb.OnClicked:Add(self, self.OpenDisturbWindows)
  self.Text_DontDisturbDesc:SetText(GText("UI_Chat_Ignore"))
end

function M:Destruct()
  self.Panel_Chat_TeamInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Button_Tab.OnClicked:Remove(self, self.BtnTeamInfoOnClicked)
  M.Super.Destruct(self)
end

function M:Close()
  self.List_SubTab:ClearListItems()
  self.List_Player:ClearListItems()
  ChatModel:SetCurrentChannel(ChatCommon.ChannelDef.TeamUp)
  M.Super.Close(self)
end

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  self.Com_Input:SetText("")
  local AllChannelInfo = {}
  local Index = 0
  local ChannelType2Index = {}
  for Id, ChannelInfo in ipairs(DataMgr.Channel) do
    if not ChatModel:IsChannelExclude(Id) then
      Index = Index + 1
      local Text = GText(ChannelInfo.Name)
      table.insert(AllChannelInfo, {
        Text = Text,
        TabId = Id,
        IconPath = ChannelInfo.Icon,
        ChannelType = Id
      })
      ChannelType2Index[Id] = Index
    end
  end
  local ChannelCount = #AllChannelInfo
  if not self.bInDungeonSettlement then
    AllChannelInfo[ChatCommon.ChannelDef.SettlementOnline] = nil
    ChannelCount = ChannelCount - 1
  end
  self.List_SubTab:ClearListItems()
  self.NeedSelectItemIndex = 1
  self.ChannelTypeToIdx = {}
  local ItemContentClass = LoadClass("/Game/UI/Blueprint/CommonItemContent.CommonItemContent_C")
  local Avatar = GWorld:GetAvatar()
  local ActuralIndex = 0
  for Idx = 1, ChannelCount do
    if AllChannelInfo[Idx].ChannelType == ChatCommon.ChannelDef.Friend then
    else
      local ItemObject = NewObject(ItemContentClass)
      local ChannelSubInfo = AllChannelInfo[Idx]
      ItemObject.Index = Idx
      ItemObject.TabId = ChannelSubInfo.TabId
      ItemObject.ChannelType = ChannelSubInfo.ChannelType
      ItemObject.ChannelName = ChannelSubInfo.Text
      ItemObject.ChannelIcon = ChannelSubInfo.IconPath
      ItemObject.NeedSelectIdx = self.NeedSelectItemIndex
      ItemObject.ParentWidget = self
      ItemObject.bNotDisturb = 1 == Avatar.ChatChannelMute[ChannelSubInfo.ChannelType]
      self.ChannelTypeToIdx[ChannelSubInfo.ChannelType] = ActuralIndex
      ActuralIndex = ActuralIndex + 1
      self.List_SubTab:AddItem(ItemObject)
    end
  end
  self.LastSelectChannelItem = self.List_SubTab:GetItemAt(math.max(0, self.NeedSelectItemIndex - 1))
  local TabOneInfo = {
    Text = GText("UI_Chat_Channel_Public"),
    TabId = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Common/T_Entrance_Chat.T_Entrance_Chat"
  }
  self.TabIcon_1:Update(1, TabOneInfo)
  self.TabIcon_1:BindEventOnSwitchOn(self, self.OnTabSelected)
  self.TabIcon_1:BindSoundFunc(function(self)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
  end, self)
  self.TabIcon_1:SetSwitchOn(true)
  self:HideAllChildrenNode(self.TabIcon_1.Panel_Name, true, true)
  local TabTwoInfo = AllChannelInfo[ChannelType2Index[ChatCommon.ChannelDef.Friend]]
  if TabTwoInfo then
    self.TabIcon_2:SetVisibility(UIConst.VisibilityOp.Visible)
    self.TabIcon_2:Update(2, TabTwoInfo)
    self.TabIcon_2:BindEventOnSwitchOn(self, self.OnTabSelected)
    self.TabIcon_2:BindSoundFunc(function(self)
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
    end, self)
    self.TabIcon_2:SetSwitchOn(false)
    self:HideAllChildrenNode(self.TabIcon_2.Panel_Name, true, true)
  else
    self.TabIcon_2:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.WS_TabList:SetActiveWidgetIndex(0)
  self:AddReddotListen()
  self:FreshTabDisturbIcon()
end

function M:GetWidthOverrideForInput()
  local ChatEmoji = DataMgr.WidgetUI.ChatEmoji.UIName
  local ChatQuickMsg = DataMgr.WidgetUI.ChatQuickMsg.UIName
  if self.CurrExtraPanelName == ChatEmoji then
    local FaceAnchorSlot = self.PanelAnchor_Face.Slot
    return self.Anchor.MinDesiredWidth - FaceAnchorSlot.Padding.Left - FaceAnchorSlot.Padding.Right
  elseif self.CurrExtraPanelName == ChatQuickMsg then
    return self.Anchor.MinDesiredWidth
  end
end

function M:UpdateTabStyleByTabChange(bInOpenChannel)
  self.TabIcon_1:SetSwitchOn(bInOpenChannel)
  self.TabIcon_2:SetSwitchOn(not bInOpenChannel)
end

function M:FreshTabDisturbIcon()
  local Avatar = GWorld:GetAvatar()
  for _, TabContent in pairs(self.List_SubTab:GetListItems()) do
    if IsValid(TabContent.UI) then
      TabContent.UI:SetDisturbIcon(1 == Avatar.ChatChannelMute[TabContent.ChannelType])
    end
  end
  self.TabIcon_2:SetDisturbIcon(1 == Avatar.ChatChannelMute[ChatCommon.ChannelDef.Friend])
end

function M:_AddReddotListenInner(ChannelName, ChannelType)
  local NodeName = ChatCommon.ReddotNamePre .. ChannelName
  local Node = ReddotManager.GetTreeNode(NodeName)
  if Node and not Node:HadAddChangeCb(self) then
    ReddotManager.AddListener(NodeName, self, function(self, Count)
      local function ComputeTabNodeRedCount()
        if NodeName ~= ChatCommon.ReddotNamePre .. ChatCommon.ChannelNames[ChatCommon.ChannelDef.Friend] then
          local TotalNormalChatCount = 0
          
          for _ChannelName, _ChannelType in pairs(ChatCommon.ChannelDef) do
            if _ChannelType ~= ChatCommon.ChannelDef.Friend then
              local _NodeName = ChatCommon.ReddotNamePre .. _ChannelName
              TotalNormalChatCount = TotalNormalChatCount + ReddotManager.GetTreeNode(_NodeName).Count
            end
          end
          if TotalNormalChatCount > ChatCommon.ReddotMaxCount then
            TotalNormalChatCount = ChatCommon.ReddotMaxCount .. "+"
          end
          self.TabIcon_1:SetReddotNum(TotalNormalChatCount)
        end
      end
      
      local TabItem
      if ChannelType == ChatCommon.ChannelDef.Friend then
        TabItem = self.TabIcon_2
      else
        local ChannelIdx = self.ChannelTypeToIdx[ChannelType]
        TabItem = self.List_SubTab:GetItemAt(ChannelIdx)
      end
      if not TabItem then
        return
      end
      local TabUI
      if ChannelType == ChatCommon.ChannelDef.Friend then
        if not TabItem.Info then
          TabUI = nil
        else
          TabUI = TabItem.Info.UI
        end
      else
        TabUI = TabItem.UI
      end
      if not IsValid(TabUI) then
        if ChannelType ~= ChatCommon.ChannelDef.Friend then
          TabItem.ShowRedDotNum = Count
          ComputeTabNodeRedCount()
        end
        return
      end
      if Count > 0 then
        local NumText = tostring(Count)
        if Count > ChatCommon.ReddotMaxCount then
          NumText = ChatCommon.ReddotMaxCount .. "+"
        end
        TabUI.Reddot_Num:SetNum(NumText)
        TabUI.Reddot_Num:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        TabUI.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      ComputeTabNodeRedCount()
    end)
  end
end

function M:ResetUI()
  self.CurrSelectPlayer = nil
  self.Group_NewMessage:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_BottomEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_BottomNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_ChatNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WS_Dialoglist:SetActiveWidgetIndex(0)
  self.Group_PlayerList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_Dialog:ClearListItems()
  if self.bOpenTeamList then
    self:BtnTeamInfoOnClicked()
  end
  self.Btn_Sent:SetText(GText("UI_Chat_Send"))
end

function M:_SetUpChatMsgListTimerCallback(MsgList)
  if self._SetUpChatMsgListIndex == #MsgList then
    self:_Stop_SetUpChatMsgListTimer()
    if 0 == #MsgList then
      self.Text_DialogEmptyText:SetText(GText("UI_Chat_NoChatHistory"))
      self.WS_Dialoglist:SetActiveWidgetIndex(1)
    end
    if ChatModel:GetChannelUnreadCount() > 0 then
      ChatController:SendChatNewMsgRead()
    end
    if self.CurrSelectPlayer then
      local FriendData = self.CurrSelectPlayer.Data
      local Name = FriendData.Info.Nickname
      local Remark = FriendData.Remark and FriendData.Remark ~= "" and string.format("(%s)", FriendData.Remark) or ""
      self.Text_ChannelTitle:SetText(Name .. Remark)
    end
    return
  end
  self._SetUpChatMsgListIndex = self._SetUpChatMsgListIndex + 1
  self:_AddNewMsgToListView(MsgList[self._SetUpChatMsgListIndex])
  self.bDialogListRefreshed = false
end

function M:CalcWrapTextAt()
  local PlayerListWidth = 0
  if self.Group_PlayerList:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    PlayerListWidth = self.Group_PlayerList:GetDesiredSize().X
  elseif self.Group_SubTabList:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    PlayerListWidth = self.Group_SubTabList:GetDesiredSize().X
  end
  return self.Anchor.MinDesiredWidth - self.DialogPadding - PlayerListWidth
end

function M:SelectItemByChannelType(ChannelType)
  local ItemIdx = self.ChannelTypeToIdx[ChannelType] or 0
  local ItemObj = self.List_SubTab:GetItemAt(ItemIdx)
  self.List_SubTab:BP_SetSelectedItem(ItemObj)
  self:OnListSelectChannelClicked(ItemObj)
end

function M:BtnTeamInfoOnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if self.bOpenTeamList then
    self.Panel_Chat_TeamInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Image_TitleArrow:SetRenderTransformAngle(180)
    self.bOpenTeamList = false
    return
  end
  self.Panel_Chat_TeamInfo:InitTeamInfo(self)
  self.Image_TitleArrow:SetRenderTransformAngle(0)
  self.Panel_Chat_TeamInfo:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.bOpenTeamList = true
end

function M:OnListSelectChannelClicked(Content)
  if self.LastSelectChannelItem and self.LastSelectChannelItem.UI then
    self.LastSelectChannelItem.UI:SetIsSelected(false)
  end
  if Content and Content.UI then
    Content.UI:SetIsSelected(true)
  end
  self.LastSelectChannelItem = Content
  self:OnHandleChangeChannel(self.TabIcon_1, Content)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
end

function M:OnTabSelected(TabWidget)
  ChatModel:GetChannelRemovedMsgs()
  local TabIdx = TabWidget.Idx
  self.CurrSelectTabIdx = TabIdx
  self._bIsChatInOpenChannel = 1 == TabIdx
  local ItemInfo = {}
  if 1 == TabIdx then
    self.TabIcon_2:SetSwitchOn(false)
    local SelectedItemObj = self.List_SubTab:BP_GetSelectedItem()
    if nil == SelectedItemObj then
      SelectedItemObj = self.List_SubTab:GetItemAt(0)
      self.List_SubTab:BP_SetSelectedItem(SelectedItemObj)
    end
    ItemInfo.TabId = SelectedItemObj.TabId
    ItemInfo.ChannelType = SelectedItemObj.ChannelType
    ItemInfo.ChannelName = SelectedItemObj.ChannelName
    self.WS_TabList:SetActiveWidgetIndex(0)
  elseif 2 == TabIdx then
    self.TabIcon_1:SetSwitchOn(false)
    ItemInfo.TabId = TabWidget.Info.TabId
    ItemInfo.ChannelType = TabWidget.Info.ChannelType
    ItemInfo.ChannelName = TabWidget.Info.Text
    self.WS_TabList:SetActiveWidgetIndex(1)
  end
  self:OnHandleChangeChannel(TabWidget, ItemInfo)
end

function M:OnHandleChangeChannel(TabWidget, ItemInfo)
  self:ResetUI()
  if ChatModel:GetCurrentChannel() ~= ItemInfo.ChannelType then
    ChatModel:SetChannelMsgCache(self.Com_Input:GetText())
  end
  self.CurrChannel = ItemInfo.ChannelType
  if not self._bSelectedPlayerToChat then
    ChatModel:SetCurrentFriendUid(nil)
  end
  ChatModel:SetCurrentChannel(self.CurrChannel)
  local Switch = {
    [ChatCommon.ChannelDef.TeamUp] = self.OnTabSelected_TeamUp,
    [ChatCommon.ChannelDef.Friend] = self.OnTabSelected_Friend,
    [ChatCommon.ChannelDef.Public] = self.OnTabSelected_Public,
    [ChatCommon.ChannelDef.InTeam] = self.OnTabSelected_InTeam,
    [ChatCommon.ChannelDef.Region] = self.OnTabSelected_Region
  }
  if self.bInDungeonSettlement then
    Switch[ChatCommon.ChannelDef.SettlementOnline] = self.OnTabSelected_SettlementOnline
  end
  Switch[self.CurrChannel](self, TabWidget, ItemInfo)
  self:OnHandleChangeChannelWithOperate(TabWidget, ItemInfo)
end

function M:OnHandleChangeChannelWithOperate(TabWidget, ItemInfo)
  if self.CurrChannel == ChatCommon.ChannelDef.Friend then
    local AllFriendItems = FriendController:GetModel():GetFriendList()
    local NeedActiveIdx = #AllFriendItems > 0 and 0 or 1
    self.WS_PlayerList:SetActiveWidgetIndex(NeedActiveIdx)
    local SelectedItemObj = self.List_Player:BP_GetSelectedItem()
    if SelectedItemObj then
      local FriendData = SelectedItemObj.Data
      local Name = FriendData.Info.Nickname
      local Remark = FriendData.Remark and FriendData.Remark ~= "" and string.format("(%s)", FriendData.Remark) or ""
      self.Text_ChannelTitle:SetText(Name .. Remark)
    else
      self.Text_ChannelTitle:SetText(GText(ItemInfo.ChannelName))
    end
    self.Button_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_ChannelNum:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Image_TitleArrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif self.CurrChannel == ChatCommon.ChannelDef.InTeam then
    self.Text_ChannelTitle:SetText(GText(ItemInfo.ChannelName))
    self:RefreshTeamMemberListInMobile()
  else
    self.Text_ChannelTitle:SetText(GText(ItemInfo.ChannelName))
    self.Button_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_ChannelNum:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Image_TitleArrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnRefreshTeamChannelInfo(bIsOverallRefresh)
  if bIsOverallRefresh then
    self:OnTabSelected_InTeam()
  end
  local TeamNumber = self:RefreshTeamMemberListInMobile()
  if TeamNumber > 0 then
    self.Panel_Chat_TeamInfo:InitTeamInfo(self)
  end
end

function M:RefreshTeamMemberListInMobile()
  local TeamData = ChatModel:GetTeamForChat()
  local TeamNumber = nil == TeamData and 0 or #TeamData.Members
  if 0 == TeamNumber then
    if self.bOpenTeamList then
      self:BtnTeamInfoOnClicked()
    end
    self.Button_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_ChannelNum:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Image_TitleArrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Button_Tab:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_ChannelNum:SetText(string.format("%d/%d", TeamNumber, TeamCommon.MaxTeamMembers))
    self.Text_ChannelNum:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Image_TitleArrow:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  return TeamNumber
end

function M:HandleGoToTeamType()
  if self.CurrChannel == ChatCommon.ChannelDef.Friend then
    self:UpdateTabStyleByTabChange(false)
  end
  self:SelectItemByChannelType(ChatCommon.ChannelDef.TeamUp)
end

function M:HandleAddBlackList()
  self:UpdateTabStyleByTabChange(self._bIsChatInOpenChannel)
end

function M:HandleSelectPlayerToChat(Uid)
  self._bSelectedPlayerToChat = true
  self:UpdateTabStyleByTabChange(false)
  self._bSelectedPlayerToChat = false
end

function M:TryToDefaultFocusWidget()
end

function M:UpdateUIStyleInPlatform()
end

return M
