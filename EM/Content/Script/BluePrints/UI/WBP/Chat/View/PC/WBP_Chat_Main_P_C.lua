require("UnLua")
local ChatModel = ChatController:GetModel()
local Handled = UE4.UWidgetBlueprintLibrary.Handled()
local Unhandled = UE4.UWidgetBlueprintLibrary.Unhandled()
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local ChatFocusType = ChatCommon.ChatFocusType
local ChatEventType = {
  Chat = 0,
  Friend = 1,
  Team = 2
}
local M = Class({
  "BluePrints.UI.WBP.Chat.View.WBP_Chat_MainBase_C"
})

function M:Test()
  local Json = [[
{
    "data":{
        "text":"gggggggggggggggggg",
        "status":"sure"
    }
}
    ]]
  self.EditingInputField = self.Com_Input.Text_Input
  self:OnRecvCloudGameKeyBoardInput(Json)
  self.EditingInputField:SetFocus()
end

function M:Construct()
  M.Super.Construct(self)
  self.LastMousePos = nil
  ChatController:OverrideButtonSound(self.Btn_Min, "event:/ui/common/click_btn_small")
  self.Btn_Min:BindEventOnReleased(self, self.BtnMinOnReleased)
  self.Btn_DragRT.OnMouseButtonDownEvent:Bind(self, self.BtnDragOnMouseButtonDownRT)
  self.Btn_DragRB.OnMouseButtonDownEvent:Bind(self, self.BtnDragOnMouseButtonDownRB)
  self.Btn_DragLB.OnMouseButtonDownEvent:Bind(self, self.BtnDragOnMouseButtonDownLB)
  self.Btn_DragLT.OnMouseButtonDownEvent:Bind(self, self.BtnDragOnMouseButtonDownLT)
  self.Image_TabBG.OnMouseButtonDownEvent:Bind(self, self.ImageTabBGOnMouseButtonDown)
  self.Btn_Reset.OnClicked:Add(self, self.BtnResetOnClicked)
  ChatController:OverrideButtonSound(self.Btn_QuickReply, "event:/ui/common/team_click_btn_small_main")
  self.Btn_Sent:BindOnClick(self, function(self)
    self:BtnSendOnClicked()
  end)
  self.Com_Input:Init({
    Owner = self,
    HintText = GText("UI_Chat_InputHint"),
    TextLimit = DataMgr.GlobalConstant.ChatMsgMaxLen.ConstantValue,
    bLimitSpaces = true,
    PasteKeyName = "RS",
    Events = {
      OnTextChanged = function(self, Text)
        if "" == Text then
          self.Btn_Sent:SetForbidden()
        elseif self.Btn_Sent:IsForbidden() and not ChatController:IsSendCDTimerExist(self.CurrChannel) then
          self.Btn_Sent:SetNormal()
        end
        self.Btn_Sent.Key_Text:SetForbidKey(self.Btn_Sent:IsForbidden())
        if self.Com_Input:Utf8StrLen(Text) > self.Com_Input.TextLimit then
          self.PanelAnchor:Close()
          self.PanelAnchor_Face:Close()
        end
      end,
      OnTextCommitted = function(self, Text, CommitType)
        if CommitType == ETextCommit.OnEnter then
          if "" ~= Text then
            self:BtnSendOnClicked()
          else
            self:Close()
          end
        end
      end
    }
  })
  self.Com_Input.Text_Input:BP_SetClearKeyboardFocusOnCommit(false)
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
    self:InitDefaultFocusWidget(ChatEventType.Chat, EventId)
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
    self:InitDefaultFocusWidget(ChatEventType.Friend, EventId)
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
    self:InitDefaultFocusWidget(ChatEventType.Team, EventId)
  end)
  self.Key_DontDisturb:CreateGamepadKey("View")
  self.Btn_DontDisturb.Button_Area.OnClicked:Add(self, self.OpenDisturbWindows)
end

function M:Destruct()
  self.Image_TabBG.OnMouseButtonDownEvent:Unbind()
  self.Btn_DragRT.OnMouseButtonDownEvent:Unbind()
  self.Btn_DragRB.OnMouseButtonDownEvent:Unbind()
  self.Btn_DragLB.OnMouseButtonDownEvent:Unbind()
  self.Btn_DragLT.OnMouseButtonDownEvent:Unbind()
  self.Btn_Reset.OnClicked:Remove(self, self.BtnResetOnClicked)
  self.Btn_Min:UnBindEventOnReleased(self, self.BtnMinOnReleased)
  M.Super.Destruct(self)
end

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  self.BackgroundBlur_50:SetRenderOpacity(1)
  self.WidgetSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Anchor)
  ChatModel:InitOriginMainUITransform(self.WidgetSlot)
  self.WidgetSlot:SetPosition(ChatModel:GetMainUIPos())
  self.WidgetSlot:SetSize(ChatModel:GetMainUISize())
  self.WidgetPivot = self.WidgetSlot:GetAlignment()
  self.OriginPivotX, self.OriginPivotY = self.WidgetPivot.X, self.WidgetPivot.Y
  self.Com_Input:SetText("")
  local Tabs = {}
  local Index = 0
  local ChannelType2Index = {}
  for Id, ChannelInfo in pairs(DataMgr.Channel) do
    if not ChatModel:IsChannelExclude(Id) then
      Index = Index + 1
      local Text = GText(ChannelInfo.Name)
      table.insert(Tabs, {
        Text = Text,
        TabId = Index,
        IconPath = ChannelInfo.Icon,
        ChannelType = Id
      })
      ChannelType2Index[Id] = Index
    end
  end
  if not self.bInDungeonSettlement then
    Tabs[ChannelType2Index[ChatCommon.ChannelDef.SettlementOnline]] = nil
  end
  table.sort(Tabs, function(a, b)
    return a.TabId < b.TabId
  end)
  local TabInfo = {
    StyleName = "Text",
    Tabs = Tabs,
    OwnerPanel = self,
    InfoCallback = "NotShow",
    bAllowKeyForbid = false,
    ChildWidgetBPPath = "/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem07.WBP_Com_TabSubItem07",
    LeftGamePadKey = "LeftShoulder",
    RightGamePadKey = "RightShoulder"
  }
  self.WBP_Com_TabSub01:Init(TabInfo)
  self:InitFocusWidget()
  self:InitUIStyleInPlatform()
  self:FreshTabDisturbIcon()
  self.WBP_Com_TabSub01:BindEventOnTabSelected(self, self.OnTabSelected)
  self.WBP_Com_TabSub01:SelectTab(ChannelType2Index[ChatModel:GetCurrentChannel()] or 1)
  self.WBP_Com_TabSub01.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WBP_Com_TabSub01.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddReddotListen()
end

function M:FreshTabDisturbIcon()
  local Avatar = GWorld:GetAvatar()
  for index, TabWidget in pairs(self.WBP_Com_TabSub01.List_Tab:GetAllChildren()) do
    local ChannelId = TabWidget.Info.ChannelType
    TabWidget:SetDisturbIcon(1 == Avatar.ChatChannelMute[ChannelId])
  end
end

function M:GetWidthOverrideForInput()
  local ChatEmoji = DataMgr.WidgetUI.ChatEmoji.UIName
  local ChatQuickMsg = DataMgr.WidgetUI.ChatQuickMsg.UIName
  if self.CurrExtraPanelName == ChatEmoji then
    local FaceAnchorSlot = self.PanelAnchor_Face.Slot
    return self.WidgetSlot:GetSize().X - FaceAnchorSlot.Padding.Left - FaceAnchorSlot.Padding.Right
  elseif self.CurrExtraPanelName == ChatQuickMsg then
    return self.WidgetSlot:GetSize().X
  end
end

function M:BtnMinOnReleased()
  self:Close()
  self:SetFocus()
end

function M:BtnResetOnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_click_btn_small_main", nil, nil)
  ChatModel:ResetCachedMainUITransform()
  self.WidgetSlot:SetPosition(ChatModel:GetMainUIPos())
  self.WidgetSlot:SetSize(ChatModel:GetMainUISize())
  self.Btn_Reset:SetVisibility(UIConst.VisibilityOp.Hidden)
  self.Key_Reset:SetVisibility(UIConst.VisibilityOp.Hidden)
end

function M:OnTabSelected(TabWidget, TabItemInfo)
  ChatModel:GetChannelRemovedMsgs()
  self:ResetUI()
  if ChatModel:GetCurrentChannel() ~= TabItemInfo.ChannelType then
    ChatModel:SetChannelMsgCache(self.Com_Input:GetText())
  end
  self.CurrChannel = TabItemInfo.ChannelType
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
  self.MaxScrollOffset = 0
  self.CanSelectChat = false
  self:SetFocusStateType(ChatFocusType.Default)
  Switch[self.CurrChannel](self, TabWidget, TabItemInfo)
  self:UpdateUIStyleInPlatform()
  self:SetFocus()
end

function M:_AddReddotListenInner(ChannelName, ChannelType)
  local NodeName = ChatCommon.ReddotNamePre .. ChannelName
  local Node = ReddotManager.GetTreeNode(NodeName)
  if Node and not Node:HadAddChangeCb(self) then
    ReddotManager.AddListener(NodeName, self, function(self, Count)
      local Tabs = self.WBP_Com_TabSub01.Tabs
      if not Tabs or not Tabs[ChannelType] then
        return
      end
      local TabUI = Tabs[ChannelType].UI
      if not IsValid(TabUI) then
        return
      end
      if Count > 0 then
        local NumText = tostring(Count)
        if Count >= ChatCommon.ReddotMaxCount then
          NumText = ChatCommon.ReddotMaxCount .. "+"
        end
        TabUI.Reddot_Num:SetNum(NumText)
        TabUI.Reddot_Num:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      else
        TabUI.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end)
  end
end

function M:ResetUI()
  self.CurrSelectPlayer = nil
  self.Group_NewMessage:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_BottomEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_ChatEmpty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_BottomNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_ChatNormal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WS_Dialoglist:SetActiveWidgetIndex(0)
  self.Group_PlayerList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_Dialog:ClearListItems()
  self.Btn_Sent:SetText(GText("UI_Chat_Send"))
end

function M:RefreshTeamMemberListInPC()
  local NowCount, TotalCount = 0, DataMgr.GlobalConstant.MaxTeamMember.ConstantValue
  self.List_Player:ClearListItems()
  local TeamData = ChatModel:GetTeamForChat()
  for i = 1, TeamCommon.MaxTeamMembers do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Owner = self
    NowCount = NowCount + 1
    local Member = nil ~= TeamData and TeamData.Members[i] or nil
    Content.Data = Member
    Content.bSelected = false
    Content.bNotNeedClickBtn = true
    Content.Index = Member and Member.Index or nil
    self.List_Player:AddItem(Content)
  end
  local TeamNumber = nil == TeamData and 0 or #TeamData.Members
  if TeamNumber > 0 and TeamNumber < TeamCommon.MaxTeamMembers then
    self.List_Player:GetItemAt(TeamNumber - 1).IsStopNavDown = true
  end
  self.Text_PlayerNum:SetText(string.format("%d/%d", TeamNumber, TotalCount))
  return NowCount
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
  end
  return self.WidgetSlot:GetSize().X - self.DialogPadding - PlayerListWidth
end

function M:HandleGoToTeamType()
  self.WBP_Com_TabSub01:SelectTab(ChatCommon.ChannelDef.TeamUp)
end

function M:HandleAddBlackList()
  self.WBP_Com_TabSub01:SelectTab(self.CurrChannel)
end

function M:HandleSelectPlayerToChat(Uid)
  self._bSelectedPlayerToChat = true
  self.WBP_Com_TabSub01:SelectTab(ChatCommon.ChannelDef.Friend)
  self._bSelectedPlayerToChat = false
end

function M:FreshGamePadView()
  self.Group_DontDisturb:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Key_DontDisturb:PlayAnimation(self.Key_DontDisturb.Normal)
end

function M:FreshMouseAndKeyboardView()
  self.Group_DontDisturb:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnPreviewKeyDown(MyGeo, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.PreViewKeyTable == nil then
    self.PreViewKeyTable = {
      [UIConst.GamePadKey.DPadDown] = function()
        if self.Group_NewMessage:IsVisible() then
          self:BtnNewMsgOnClicked()
          self:NavigateToLastMsg()
          return true
        end
      end,
      [Const.GamepadDPadUp] = function()
        if self.Key_Reset:IsVisible() then
          self:BtnResetOnClicked()
          return true
        end
        return false
      end,
      [Const.GamepadDPadLeft] = function()
        if not self.Group_ChatEmpty:IsVisible() and self.Group_QuickReplyKey:IsVisible() then
          self:BtnQuickReplyOnPressed()
          self:BtnQuickReplyOnReleased()
          return true
        end
      end,
      [Const.GamepadDPadRight] = function()
        if not self.Group_ChatEmpty:IsVisible() and self.Group_FaceKey:IsVisible() then
          self:BtnfaceOnPressed()
          self:BtnFaceOnReleased()
          return true
        end
      end,
      [Const.GamepadSpecialLeft] = function()
        if self.Group_DontDisturb:IsVisible() and self.IsForBidDisturb == false and not self:IsAnimationPlaying(self.Auto_Out) then
          UIUtils.PlayCommonBtnSe(self)
          self:OpenDisturbWindows()
          return true
        end
      end
    }
  end
  local HandleFunc = self.PreViewKeyTable[InKeyName]
  if HandleFunc and HandleFunc() then
    return Handled
  end
  return Unhandled
end

function M:OnKeyDown(MyGeo, InKeyEvent)
  if self.IsBeginToClose then
    return Unhandled
  end
  local ParentHandled = M.Super.OnKeyDown(self, MyGeo, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and self:OnGamePadDown(InKeyName) then
    return Handled
  end
  if InKeyName == DataMgr.KeyboardText.Enter.Key then
    if self.Com_Input:GetText() ~= "" then
      self:BtnSendOnClicked()
    end
    if InKeyName ~= DataMgr.KeyboardMap.OpenChat.Key then
      return Handled
    end
  end
  if InKeyName == DataMgr.KeyboardMap.OpenChat.Key then
    if self.Com_Input:GetText() == "" then
      self:Close()
    end
    return Handled
  end
  return ParentHandled
end

function M:OnKeyUp(MyGeo, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  ScreenPrint("OnKeyUp:" .. InKeyName)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == Const.GamepadSpecialLeft then
    self.IsForBidDisturb = false
  end
  return Unhandled
end

function M:OnRefreshTeamChannelInfo(bIsOverallRefresh)
  if bIsOverallRefresh then
    self:OnTabSelected_InTeam()
  end
  self:RefreshTeamMemberListInPC()
end

function M:OnMouseButtonUp(MyGeometry, InMouseEvent)
  if self.bBtnDragPressed then
    self.bBtnDragPressed = false
    if IsValid(self.CurrExtraPanel) then
      self.CurrExtraPanel:UpdateWidth()
    end
    self:_SetAnchorPivot(self.OriginPivotX, self.OriginPivotY)
  end
  if self.bBtnTabPressed then
    self.bBtnTabPressed = false
  end
  self:SetCursor(EMouseCursor.Default)
  local Reply = UE4.UWidgetBlueprintLibrary.DetectDragIfPressed(InMouseEvent, self, EKeys.LeftMouseButton)
  return UE4.UWidgetBlueprintLibrary.ReleaseMouseCapture(Reply)
end

function M:OnMouseMove(MyGeometry, InMouseEvent)
  if not self.bBtnDragPressed and not self.bBtnTabPressed then
    self:SetCursor(EMouseCursor.Default)
    local Reply = UE4.UWidgetBlueprintLibrary.DetectDragIfPressed(InMouseEvent, self, EKeys.LeftMouseButton)
    return UE4.UWidgetBlueprintLibrary.ReleaseMouseCapture(Reply)
  end
  local ViewportScale = UE4.UWidgetLayoutLibrary.GetViewportScale(self)
  local MousePos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InMouseEvent)
  local VMousePos = UE4.USlateBlueprintLibrary.AbsoluteToViewport(self, MousePos)
  local DeltaX = (VMousePos.X - self.LastMousePos.X) / ViewportScale
  local DeltaY = (VMousePos.Y - self.LastMousePos.Y) / ViewportScale
  self.LastMousePos = VMousePos
  local ViewportSize = UE4.UWidgetLayoutLibrary.GetViewportSize(self)
  local NorViewportSizeX = ViewportSize.X / ViewportScale
  local NorViewportSizeY = ViewportSize.Y / ViewportScale
  local WidgetPos = self.WidgetSlot:GetPosition()
  local WidgetSize = self.WidgetSlot:GetSize()
  local OneMinusPivotX = 1 - self.WidgetPivot.X
  local OneMinusPivotY = 1 - self.WidgetPivot.Y
  if self.bBtnDragPressed then
    local NewWidgetSizeX = WidgetSize.X + DeltaX * math.sign(self.OriginPivotX - self.WidgetPivot.X)
    local NewWidgetSizeY = WidgetSize.Y + DeltaY * math.sign(self.OriginPivotY - self.WidgetPivot.Y)
    local CacheNewSize = ChatModel:GetMainUISize()
    CacheNewSize.X = math.clamp(NewWidgetSizeX, self.MinWidth, math.abs(NorViewportSizeX * OneMinusPivotX - WidgetPos.X))
    CacheNewSize.Y = math.clamp(NewWidgetSizeY, self.MinHeight, math.abs(NorViewportSizeY * OneMinusPivotY - WidgetPos.Y))
    self.WidgetSlot:SetSize(CacheNewSize)
  end
  if self.bBtnTabPressed then
    local NewWidgetPosX = WidgetPos.X + DeltaX
    local NewWidgetPosY = WidgetPos.Y + DeltaY
    local CacheNewPos = ChatModel:GetMainUIPos()
    CacheNewPos.X = math.clamp(NewWidgetPosX, WidgetSize.X * self.WidgetPivot.X, NorViewportSizeX - WidgetSize.X * OneMinusPivotX)
    CacheNewPos.Y = math.clamp(NewWidgetPosY, WidgetSize.Y * self.WidgetPivot.Y, NorViewportSizeY - WidgetSize.Y * OneMinusPivotX)
    self.WidgetSlot:SetPosition(CacheNewPos)
    self:RefreshUIReset()
  end
  return Unhandled
end

function M:ImageTabBGOnMouseButtonDown(MyGeometry, InMouseEvent)
  self:SetCursor(EMouseCursor.GrabHandClosed)
  local MousePos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InMouseEvent)
  self.LastMousePos = UE4.USlateBlueprintLibrary.AbsoluteToViewport(self, MousePos)
  if not self.bBtnTabPressed then
    self.bBtnTabPressed = true
  end
  local Reply = UE4.UWidgetBlueprintLibrary.DetectDragIfPressed(InMouseEvent, self, EKeys.LeftMouseButton)
  return UE4.UWidgetBlueprintLibrary.CaptureMouse(Reply, self)
end

function M:BtnDragOnMouseButtonDownLB(MyGeometry, InMouseEvent)
  self:SetCursor(EMouseCursor.ResizeSouthWest)
  return self:BtnDragOnMouseButtonDown(MyGeometry, InMouseEvent, 1, 0)
end

function M:BtnDragOnMouseButtonDownRB(MyGeometry, InMouseEvent)
  self:SetCursor(EMouseCursor.ResizeSouthEast)
  return self:BtnDragOnMouseButtonDown(MyGeometry, InMouseEvent, 0, 0)
end

function M:BtnDragOnMouseButtonDownLT(MyGeometry, InMouseEvent)
  self:SetCursor(EMouseCursor.ResizeSouthEast)
  return self:BtnDragOnMouseButtonDown(MyGeometry, InMouseEvent, 1, 1)
end

function M:BtnDragOnMouseButtonDownRT(MyGeometry, InMouseEvent)
  self:SetCursor(EMouseCursor.ResizeSouthWest)
  return self:BtnDragOnMouseButtonDown(MyGeometry, InMouseEvent, 0, 1)
end

function M:BtnDragOnMouseButtonDown(MyGeometry, InMouseEvent, X, Y)
  local MousePos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InMouseEvent)
  self.LastMousePos = UE4.USlateBlueprintLibrary.AbsoluteToViewport(self, MousePos)
  if not self.bBtnDragPressed then
    self.bBtnDragPressed = true
  end
  self:_SetAnchorPivot(X, Y)
  local Reply = UE4.UWidgetBlueprintLibrary.DetectDragIfPressed(InMouseEvent, self, EKeys.LeftMouseButton)
  return UE4.UWidgetBlueprintLibrary.CaptureMouse(Reply, self)
end

function M:_SetAnchorPivot(X, Y)
  local DeltaX = X - self.WidgetPivot.X
  local DeltaY = Y - self.WidgetPivot.Y
  self.WidgetPivot.X, self.WidgetPivot.Y = X, Y
  self.WidgetSlot:SetAlignment(self.WidgetPivot)
  local WidgetPos = self.WidgetSlot:GetPosition()
  local WidgetSize = self.WidgetSlot:GetSize()
  WidgetPos.X = WidgetPos.X + DeltaX * WidgetSize.X
  WidgetPos.Y = WidgetPos.Y + DeltaY * WidgetSize.Y
  self.WidgetSlot:SetPosition(WidgetPos)
  local CachePos = ChatModel:GetMainUIPos()
  CachePos.X, CachePos.Y = WidgetPos.X, WidgetPos.Y
  self:RefreshUIReset()
end

function M:InitGamepadKeyTable(InKeyName)
  self.GamepadKeyTable = {
    [Const.GamepadLeftShoulder] = function()
      self.WBP_Com_TabSub01:ClickTab(self.CurrChannel - 1)
      return true
    end,
    [Const.GamepadRightShoulder] = function()
      self.WBP_Com_TabSub01:ClickTab(self.CurrChannel + 1)
      return true
    end,
    [Const.GamepadSpecialLeft] = function()
      if self.IsInit and self.Group_NewMessage:IsVisible() then
        self:BtnNewMsgOnClicked()
        self:NavigateToLastMsg()
        return true
      end
      return false
    end,
    [Const.GamepadSpecialRight] = function()
      if self.CurrChannel == ChatCommon.ChannelDef.InTeam and self.Key_PlayerListTitle:IsVisible() then
        self:RefreshFocusWidget(ChatFocusType.PlayerList)
        return true
      end
      return false
    end,
    [Const.GamepadLeftThumbstick] = function()
      if self.FocusStateType == ChatFocusType.SelectChat or not self.CanSelectChat then
        return false
      end
      local FocusStateType = ChatFocusType.ScrollBox
      if self.FocusStateType == FocusStateType or self.FocusStateType == ChatFocusType.PlayerList then
        FocusStateType = ChatFocusType.SelectChat
      end
      self:RefreshFocusWidget(FocusStateType)
      return true
    end,
    [Const.GamepadFaceButtonRight] = function()
      local RefreshFocusState
      local IsFriend = self.CurrChannel == ChatCommon.ChannelDef.Friend
      if self.FocusStateType == ChatFocusType.SelectChat then
        RefreshFocusState = IsFriend and ChatFocusType.PlayerList or ChatFocusType.ScrollBox
      elseif self.CurrChannel == ChatCommon.ChannelDef.InTeam and self.FocusStateType == ChatFocusType.PlayerList then
        RefreshFocusState = ChatFocusType.ScrollBox
      end
      if RefreshFocusState then
        self:RefreshFocusWidget(RefreshFocusState)
      else
        self:BtnMinOnReleased()
      end
      return true
    end
  }
end

function M:OnGamePadDown(InKeyName)
  if self:CheckIsOpenHeadBtnList() then
    return false
  end
  if not self.GamepadKeyTable then
    self:InitGamepadKeyTable()
  end
  local IsEventHandled = false
  if self.GamepadKeyTable[InKeyName] then
    return self.GamepadKeyTable[InKeyName]()
  end
  if self.Com_Input.IsShowGamPadKey then
    if InKeyName == Const.GamepadFaceButtonLeft then
      if self.Group_ChatEmpty:IsVisible() then
        self:BtnEmptyOnClicked()
      else
        self:RefreshFocusWidget(ChatFocusType.InputField)
      end
      IsEventHandled = true
    elseif InKeyName == Const.GamepadRightThumbstick then
      if self.Com_Input:GetText() ~= "" then
        self.Com_Input:OnDeleteBtnClicked()
        self:RefreshFocusWidget(ChatFocusType.InputField)
        IsEventHandled = true
      end
    elseif InKeyName == Const.GamepadFaceButtonUp then
      self:BtnSendOnClicked()
      IsEventHandled = true
    end
  end
  return IsEventHandled
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.SB_Dialog:SetAlwaysShowScrollbar(self.CurInputDeviceType == ECommonInputType.Gamepad and self.MaxScrollOffset > 0)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self:HasAnyFocus() or self:HasFocusedDescendants() then
      self:TryToDefaultFocusWidget()
    end
  else
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    self.SB_Dialog:SetScrollWhenFocusChanges(UE4.EScrollWhenFocusChanges.NoScroll)
    if self.FocusStateType == ChatFocusType.SelectChat and self.CurrSelectChatItem then
      self.CurrSelectChatItem:SelectMessage(false)
    end
  end
  self:UpdateUIStyleInPlatform()
end

function M:CheckIsOpenHeadBtnList()
  local IsOpenHead = false
  if self.CurrSelectPlayer then
    IsOpenHead = self.CurrSelectPlayer.UI.IsOpen
  end
  if not IsOpenHead and self.CurrSelectChatItem then
    IsOpenHead = self.CurrSelectChatItem.IsOpen
  end
  IsOpenHead = IsOpenHead and true or false
  if IsOpenHead ~= self.IsOpenHead then
    local ScrollType = UE4.EScrollWhenFocusChanges.NoScroll
    if not IsOpenHead and self.FocusStateType == ChatFocusType.SelectChat then
      ScrollType = UE4.EScrollWhenFocusChanges.AnimatedScroll
    end
    self.SB_Dialog:SetScrollWhenFocusChanges(ScrollType)
  end
  self.IsOpenHead = IsOpenHead
  return IsOpenHead
end

function M:RefreshUIReset()
  local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad
  local IsShowReset = ChatModel:HasMainUIChanged()
  local IsShowKeyReset = IsShowReset and IsGamepad and not self.IsOpenHead and not self.IsOpenMenu
  IsShowKeyReset = IsShowKeyReset and self.FocusStateType ~= ChatFocusType.SelectChat and (self.FocusStateType ~= ChatFocusType.PlayerList or self.CurrChannel ~= ChatCommon.ChannelDef.InTeam)
  self.Btn_Reset:SetVisibility(IsShowReset and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Hidden)
  self.Key_Reset:SetVisibility(IsShowKeyReset and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Hidden)
end

function M:RefreshUIPlayerItem()
  if not self.CurrSelectPlayer or self.CurrChannel ~= ChatCommon.ChannelDef.InTeam then
    return
  end
  local UI = self.CurrSelectPlayer.UI
  local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad and self.FocusStateType == ChatFocusType.PlayerList
  UI:RefreshSelect(IsGamepad)
end

function M:UpdateUIStyleInPlatform()
  local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad and not self:CheckIsOpenHeadBtnList()
  local Visibility = IsGamepad and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed
  self.Key_Recruit:SetVisibility(Visibility)
  self.Group_BottomControllerKey:SetVisibility(Visibility)
  self.WS_NewMassage:SetActiveWidgetIndex(IsGamepad and 1 or 0)
  self.WBP_Com_TabSub01.Key_Left:GetParent():SetVisibility(Visibility)
  self.WBP_Com_TabSub01.Key_Right:GetParent():SetVisibility(Visibility)
  local BottomKeyVisibilty = Visibility
  if IsGamepad then
    local BottomKeyInfo = {}
    if self.FocusStateType == ChatFocusType.Default then
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      }
    elseif self.FocusStateType == ChatFocusType.PlayerList then
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_SelectMessages"),
        bLongPress = false
      })
      if self.MaxScrollOffset > 0 then
        table.insert(BottomKeyInfo, {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "RV",
              Owner = self
            }
          },
          Desc = GText("UI_Controller_Slide")
        })
      end
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_PlayerOptions"),
        bLongPress = false
      })
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      })
    elseif self.FocusStateType == ChatFocusType.ScrollBox then
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_SelectMessages"),
        bLongPress = false
      })
      if self.MaxScrollOffset > 0 then
        table.insert(BottomKeyInfo, {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "RV",
              Owner = self
            }
          },
          Desc = GText("UI_Controller_Slide")
        })
      end
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      })
    elseif self.FocusStateType == ChatFocusType.SelectChat then
      BottomKeyVisibilty = UIConst.VisibilityOp.Collapsed
      if self.CurrSelectChatItem then
        table.insert(BottomKeyInfo, {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
              Owner = self
            }
          },
          Desc = GText("UI_CTL_PlayerOptions")
        })
        if self.CurrSelectChatItem.MsgWrap.ModSuitInfo then
          table.insert(BottomKeyInfo, {
            KeyInfoList = {
              {
                Type = "Img",
                ImgShortPath = "X",
                Owner = self
              }
            },
            Desc = GText("UI_CTL_CheckPlan")
          })
        end
      end
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      })
    elseif self.FocusStateType == ChatFocusType.InputField then
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      }
    elseif self.FocusStateType == ChatFocusType.QuickReply or self.FocusStateType == ChatFocusType.ChatFace then
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
              Owner = self
            }
          },
          Desc = GText("UI_LOGIN_ENSURE"),
          bLongPress = false
        },
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      }
      BottomKeyVisibilty = UIConst.VisibilityOp.Collapsed
    end
    self.Com_MidKeyTips:UpdateKeyInfoNew(BottomKeyInfo)
  end
  if BottomKeyVisibilty == UIConst.VisibilityOp.Visible then
    self.Com_Input:SetGamePadKey("X", "RS")
    if self.FocusStateType ~= ChatFocusType.PlayerList or self.CurrChannel ~= ChatCommon.ChannelDef.InTeam then
      self:FreshGamePadView()
    else
      self:FreshMouseAndKeyboardView()
    end
  else
    self.Com_Input:SetGamePadKey()
    self:FreshMouseAndKeyboardView()
  end
  self.Key_PlayerListTitle:SetVisibility(TeamController:IsGamepad() and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed)
  self.Group_FaceKey:SetVisibility(BottomKeyVisibilty)
  self.Group_QuickReplyKey:SetVisibility(BottomKeyVisibilty)
  self.Btn_Sent.Key_Text:SetVisibility(BottomKeyVisibilty)
  self.Btn_Sent.Key_Text:SetForbidKey(self.Btn_Sent:IsForbidden())
  self:RefreshUIReset()
  self:RefreshUIPlayerItem()
end

function M:RefreshUIWithMenuChanged(bOpen)
  self.IsOpenMenu = bOpen
  local IsMenuFace = self.CurrExtraPanelName == DataMgr.WidgetUI.ChatEmoji.UIName
  if not bOpen then
    self:SetFocusStateType(ChatFocusType.InputField)
    self:UpdateUIStyleInPlatform()
    IsMenuFace = self.IsOpenMenuFace
  else
    self.IsOpenMenuFace = IsMenuFace
    self:RefreshFocusWidget(IsMenuFace and ChatFocusType.ChatFace or ChatFocusType.QuickReply)
  end
  if IsMenuFace then
    self.Btn_Face:SetHoldUpAnim(bOpen)
  else
    self.Btn_QuickReply:SetHoldUpAnim(bOpen)
  end
end

function M:InitUIStyleInPlatform()
  self:AddTimer(0.01, function()
    self.Btn_Sent.Key_Text:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
          Owner = self
        }
      }
    })
    self.WBP_Com_TabSub01.CurInputDeviceType = nil
    self.WBP_Com_TabSub01:RefreshOpInfoByInputDevice(self.CurInputDeviceType, UIUtils.UtilsGetCurrentGamepadName())
    self:UpdateUIStyleInPlatform()
  end)
  local bAllowForbid = false
  self.Key_Reset:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Up",
        Owner = self
      }
    },
    bAllowForbid = bAllowForbid
  })
  self.Key_Recruit:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
        Owner = self
      }
    },
    bAllowForbid = bAllowForbid
  })
  self.Key_PlayerListTitle:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Menu",
        Owner = self
      }
    },
    bAllowForbid = bAllowForbid
  })
  self.Key_NewMassage:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Down",
        Owner = self
      }
    },
    bAllowForbid = bAllowForbid
  })
  self.Key_QuickReply:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Left",
        Owner = self
      }
    },
    bAllowForbid = bAllowForbid
  })
  self.Key_Face:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Right",
        Owner = self
      }
    },
    bAllowForbid = bAllowForbid
  })
  self.Btn_Sent:SetForbidden()
  self.Com_MidKeyTips:ClearChildren()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem = GameInputModeSubsystem
  self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType(), GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:InitFocusWidget()
  self:SetFocusStateType(ChatFocusType.Default)
  self:StopWidgetNavgationRuleBase(self.Com_MidKeyTips)
  self:StopWidgetNavgationRuleBase(self.WBP_Com_TabSub01)
  self:StopWidgetNavgationRuleBase(self.List_Player)
  self:StopWidgetNavgationRuleBase(self.List_Dialog)
  self:StopWidgetNavgationRuleBase(self.SB_Dialog)
end

function M:StopWidgetNavgationRuleBase(Widget)
  Widget:SetIsShowNavigateGuide(false)
  Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end

function M:TryToDefaultFocusWidget()
  if self.Com_Input:HasFocusedDescendants() then
    self:SetFocusStateType(ChatFocusType.InputField)
    return
  end
  local FocusStateType = self.FocusStateType
  self:SetFocusStateType(ChatFocusType.Default)
  self:InitDefaultFocusWidget()
  if self.FocusStateType == ChatFocusType.Default and FocusStateType ~= ChatFocusType.InputField then
    self:SetFocusStateType(FocusStateType)
  end
end

function M:InitDefaultFocusWidget(EventType, EventId)
  if self.FocusStateType ~= ChatFocusType.Default then
    return
  end
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self.IsDelayInitFocus then
    return
  end
  self.IsDelayInitFocus = true
  self:AddTimer(0.1, function()
    self.IsDelayInitFocus = false
    if self.CurrChannel == ChatCommon.ChannelDef.Friend and self.List_Player:GetNumItems() > 0 then
      self:SetPlayerListFocus()
    elseif self.CanSelectChat then
      self:SetScrollBoxFocus()
    end
  end)
end

function M:OnInitSelectMask()
  if self.CanSelectChat then
    return
  end
  self.CanSelectChat = true
  if self.FocusStateType == ChatFocusType.Default then
    self:SetScrollBoxFocus()
  end
end

function M:SetFocusStateType(FocusStateType)
  if self.FocusStateType == FocusStateType then
    return
  end
  if self.FocusStateType == ChatFocusType.SelectChat then
    self.SB_Dialog:SetScrollWhenFocusChanges(UE4.EScrollWhenFocusChanges.NoScroll)
    if self.CurrSelectChatItem then
      self.CurrSelectChatItem:SelectMessage(false)
    end
  end
  if self.FocusStateType == ChatFocusType.ScrollBox then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  self.FocusStateType = FocusStateType
end

function M:SetPlayerListFocus()
  if self.FocusStateType == ChatFocusType.Default then
    if self:HasAnyFocus() then
      self.List_Player:SetFocus()
    end
    self.List_Player:NavigateToIndex(self.SelectedPlayerIndex or 0)
  else
    self.List_Player:SetFocus()
  end
  self:SetFocusStateType(ChatFocusType.PlayerList)
  self:UpdateUIStyleInPlatform()
end

function M:SetScrollBoxFocus()
  self:SetFocusStateType(ChatFocusType.ScrollBox)
  self.Com_MidKeyTips:SetFocus()
  self:UpdateUIStyleInPlatform()
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
end

function M:SetSelectChatFocus()
  if not self:NavigateToDialogIndex() then
    return
  end
  self:UpdateUIStyleInPlatform()
  self.SB_Dialog:SetScrollWhenFocusChanges(UE4.EScrollWhenFocusChanges.AnimatedScroll)
end

function M:SetInputFieldFocus()
  self:SetFocusStateType(ChatFocusType.InputField)
  self:_SetUpMsgCache()
  self.Com_Input:FocusInputField()
  self:UpdateUIStyleInPlatform()
end

function M:SetQuickReplyFocus()
  if not self.CurrExtraPanel then
    return
  end
  self:SetFocusStateType(ChatFocusType.QuickReply)
  self.CurrExtraPanel:SetFocus()
  self:UpdateUIStyleInPlatform()
end

function M:SetChatFaceFocus()
  if not self.CurrExtraPanel then
    return
  end
  self:SetFocusStateType(ChatFocusType.ChatFace)
  self.CurrExtraPanel:SetFocus()
  self:UpdateUIStyleInPlatform()
end

function M:RefreshFocusWidget(RefreshState)
  if self.FocusStateType == RefreshState then
    return
  end
  local SwitchFocusFuncs = {
    [ChatFocusType.PlayerList] = self.SetPlayerListFocus,
    [ChatFocusType.ScrollBox] = self.SetScrollBoxFocus,
    [ChatFocusType.SelectChat] = self.SetSelectChatFocus,
    [ChatFocusType.InputField] = self.SetInputFieldFocus,
    [ChatFocusType.QuickReply] = self.SetQuickReplyFocus,
    [ChatFocusType.ChatFace] = self.SetChatFaceFocus
  }
  if SwitchFocusFuncs[RefreshState] then
    SwitchFocusFuncs[RefreshState](self)
  end
end

function M:BP_GetDesiredFocusTarget()
  if self.FocusStateType == ChatFocusType.InputField then
    self:TryToDefaultFocusWidget()
  else
    local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad
    if not IsGamepad then
      self:SetFocusStateType(ChatFocusType.InputField)
      self.Com_Input:FocusInputField()
      return self.Com_Input
    end
  end
  local FocusStateType = self.FocusStateType
  if FocusStateType == ChatFocusType.ScrollBox then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    return self.Com_MidKeyTips
  end
  if FocusStateType == ChatFocusType.PlayerList or self.CurrChannel == ChatCommon.ChannelDef.Friend then
    return self.List_Player
  end
  if FocusStateType == ChatFocusType.SelectChat then
    return self.CurrSelectChatItem or self.List_Dialog
  end
  return self.Com_MidKeyTips
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local CanScroll = self.FocusStateType == ChatFocusType.ScrollBox or self.FocusStateType == ChatFocusType.PlayerList
  if not CanScroll or self.IsOpenHead or self.IsOpenMenu then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.SB_Dialog:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.MaxScrollOffset)
    self.SB_Dialog:SetScrollOffset(ScrollOffset)
    local Visibility = "SelfHitTestInvisible"
    if ScrollOffset + 100 >= self.MaxScrollOffset then
      Visibility = "Collapsed"
      ChatController:SendChatNewMsgRead()
    end
    local IsVisible = "SelfHitTestInvisible" == Visibility
    if self.Group_NewMessage:IsVisible() ~= IsVisible then
      self.Group_NewMessage:SetVisibility(UIConst.VisibilityOp[Visibility])
      self:UpdateUIStyleInPlatform()
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:FindCurrentDialogItem()
  local ChatItemList = self._ChatItemList
  if not ChatItemList then
    return
  end
  local DialogStartY = self.SB_Dialog:GetScrollOffset()
  local DialogEndY = DialogStartY + self.SB_Dialog:GetDesiredSize().Y - self.MaxScrollOffset
  local SelectItem, MinDistance
  local Num = #ChatItemList
  for k = Num, 1, -1 do
    local Item = ChatItemList[k]
    if Item.SelectMask then
      local Y0 = Item.Content.ScrollOffset
      local Y1 = Item.Content.ScrollOffset + Item:GetDesiredSize().Y
      if DialogStartY <= Y0 and DialogEndY >= Y1 then
        return Item, true
      end
      local Distance = 0
      if DialogStartY > Y0 then
        Distance = Distance + DialogStartY - Y0
      end
      if DialogEndY < Y1 then
        Distance = Distance + Y1 - DialogEndY
      end
      if not MinDistance or MinDistance > Distance then
        MinDistance = Distance
        SelectItem = Item
      end
      if DialogStartY > Y1 then
        return SelectItem, false
      end
    end
  end
  return SelectItem, false
end

function M:NavigateToDialogIndex()
  local SelectItem, IsInScroll = self:FindCurrentDialogItem()
  if SelectItem then
    self:SetFocusStateType(ChatFocusType.SelectChat)
    self.CurrSelectChatItem = SelectItem
    self.CurrSelectChatItem:SelectMessage(true)
    if not IsInScroll then
      local ScrollOffset = math.clamp(SelectItem.Content.ScrollOffset - 10, 0, self.MaxScrollOffset)
      self.SB_Dialog:SetScrollOffset(ScrollOffset)
    end
    self.List_Dialog:NavigateToIndex(SelectItem.MsgWrap.Index - 1)
  end
  return SelectItem
end

function M:NavigateToLastMsg()
  if self.FocusStateType ~= ChatFocusType.SelectChat or not self._ChatItemList then
    return
  end
  self.List_Dialog:NavigateToIndex(#self._ChatItemList - 1)
end

return M
