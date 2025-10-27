require("UnLua")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendModel = FriendController:GetModel()
local TimeUtils = require("Utils.TimeUtils")
local ChatController = require("BluePrints.UI.WBP.Chat.ChatController")
local TeamController = require("BluePrints.UI.WBP.Team.TeamController")
local TeamModel = TeamController:GetModel()
local UIUtils = require("Utils.UIUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnTeamMainFocusChanged(bFocused, bAddFocusRecv)
  if not bAddFocusRecv and not bFocused then
    return
  end
  local Visibility = bFocused and "Collapsed" or "SelfHitTestInvisible"
  local KeyWidgets = {
    self.Function_GamePad,
    self.Button_Funtion.Key_GamePad,
    self.Button_Talk.Key_GamePad,
    self.No_GamePad,
    self.Yes_GamePad
  }
  for _, KeyWidget in ipairs(KeyWidgets) do
    KeyWidget:SetVisibility(UIConst.VisibilityOp[Visibility])
  end
end

function M:OnAnimationStarted(InAnim)
  if InAnim == self.In then
    self:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  if FriendController:IsGamepad() then
    self:OnTeamMainFocusChanged(false, true)
    self:OnItemSelectionChanged(true)
    local GameInstance = GWorld.GameInstance
    local UIManager = GameInstance:GetGameUIManager()
    local FriendMain = UIManager:GetUIObj("FriendMain")
    local FriendWindow = UIManager:GetUIObj("List_Friend")
    if FriendMain then
      FriendMain:ShowPlayerInfoBtn(true)
      FriendMain:ShowCheckBtn(false)
    end
    if FriendWindow then
      FriendWindow:ShowPlayerInfoBtn(true)
    end
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if FriendController:IsGamepad() then
    self:OnItemSelectionChanged(false)
    local GameInstance = GWorld.GameInstance
    local UIManager = GameInstance:GetGameUIManager()
    local FriendMain = UIManager:GetUIObj("FriendMain")
    local FriendWindow = UIManager:GetUIObj("List_Friend")
    if FriendMain then
      FriendMain:ShowPlayerInfoBtn(false)
    end
    if FriendWindow then
      FriendWindow:ShowPlayerInfoBtn(false)
    end
  end
end

function M:Construct()
  M.Super.Construct(self)
  self.Button_Invite:BindEventOnReleased(self, self.OnBtnInviteReleased)
  FriendController:OverrideButtonSound(self.Button_Funtion, "event:/ui/common/click_btn_small", nil)
  self.Button_Funtion:BindEventOnReleased(self, self.OnBtnFunctionReleased)
  FriendController:OverrideButtonSound(self.Button_Yes, "event:/ui/common/click_btn_confirm", nil)
  self.Button_Yes:BindEventOnReleased(self, self.OnBtnYesOrNoRelease, true)
  FriendController:OverrideButtonSound(self.Button_No, "event:/ui/common/click_btn_cancel", nil)
  self.Button_No:BindEventOnReleased(self, self.OnBtnYesOrNoRelease, false)
  self.Head_Friend:BindOnClickEvent(function()
    self.Head_Anchor:Open(true)
  end)
  self.Head_Anchor.OnGetUserMenuContentEvent:Bind(self, self.OnAnchorGetUserMenuContent)
  self.Head_Anchor.OnMenuOpenChanged:Add(self, self.HeadMenuOpenChanged)
  self.Button_Invite:SetGamePadImg("A")
  self.Button_Talk:SetGamePadImg("X")
  self.Key_No:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Key_Yes:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self:SetGamepadIconVisibility(false)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:HeadMenuOpenChanged(bOpen)
  self.bMenuOpen = bOpen
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local FriendMain = UIManager:GetUIObj("FriendMain")
  local FriendWindow = UIManager:GetUIObj("List_Friend")
  if FriendMain and not ModController:IsMobile() then
    if bOpen then
      FriendMain:ShowCheckBtn(true)
      FriendMain:ShowPlayerInfoBtn(false)
      if FriendWindow then
        FriendWindow:ShowCheckBtn(true)
        FriendWindow:ShowPlayerInfoBtn(false)
      end
    else
      FriendMain:ShowCheckBtn(false)
      FriendMain:ShowPlayerInfoBtn(true)
      if FriendWindow then
        FriendWindow:ShowCheckBtn(false)
        FriendWindow:ShowPlayerInfoBtn(true)
      end
    end
  end
  if bOpen then
    return
  end
  self.Head_Friend:PlayNormal()
end

function M:ResetUI()
  self.HB_Loca:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.HB_Button_Request:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.HB_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Button_Funtion:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Button_Funtion:ForbidBtn(false)
  self.Button_Invite:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Button_Invite:ForbidBtn(false)
  self.Text_Remark:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Split_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Head_Friend:SetHoldUp(false)
  if self.Title then
    self.Title:ClearChildren()
    self.Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnAnchorGetUserMenuContent()
  local FriendMainView = FriendController:GetView(self)
  
  local function InviteTeam(Content, AvatarInfo)
    Content.Text = GText("UI_Chat_InviteTeam")
    
    function Content.Callback()
      TeamController:SendTeamInvite(AvatarInfo.Uid)
      self.Head_Anchor:Close()
    end
  end
  
  local function InitShowRecordBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Chat_ShowRecord")
    
    function Content.Callback()
      if TeamModel:IsYourself(AvatarInfo.Uid) then
        PersonInfoController:OpenView()
      else
        TeamController:GetAvatar():CheckOtherPlayerPersonallInfo(AvatarInfo.Uid)
      end
      self.Head_Anchor:Close()
      if FriendController:GetDialog(self) then
        FriendController:GetDialog(self):OnCloseBtnClicked()
      end
    end
  end
  
  local function AddBlackList(Content, AvatarInfo)
    if FriendModel:GetBlackListDict()[AvatarInfo.Uid] then
      Content.Text = GText("UI_Friend_DelBlackList")
      
      function Content.Callback()
        FriendController:SendCancelBlackList(AvatarInfo.Uid)
        self.Head_Anchor:Close()
      end
    else
      Content.Text = GText("UI_Friend_AddBlackList")
      
      function Content.Callback()
        self.Head_Anchor:Close()
        local Dialog = FriendController:GetDialog(self)
        if Dialog then
          Dialog:OnCloseBtnClicked()
          FriendController:AddTimer(Dialog.Out:GetEndTime() + 0.05, function()
            FriendController:OpenAddBlacklistDialog(self, AvatarInfo)
          end)
        else
          FriendController:OpenAddBlacklistDialog(self, AvatarInfo)
        end
      end
    end
  end
  
  local function RemarkFriend(Content, AvatarInfo)
    Content.Text = GText("UI_Friend_Remark")
    
    function Content.Callback()
      local Params = {
        UseGenaral = true,
        MultilineType = 1,
        TextLenMax = DataMgr.GlobalConstant.NicknameMaxLen.ConstantValue,
        HintText = GText("UI_Friend_RemarkInputHint"),
        OnSDKChecked = function(bRes, InputWidget, ...)
          if not bRes then
            return
          end
          FriendController:SendRequest(FriendCommon.EventId.SetRemark, AvatarInfo.Uid, ...)
        end
      }
      UIManager(self):ShowCommonPopupUI(FriendCommon.RemarkDialogNotInput, Params, FriendMainView)
      self.Head_Anchor:Close()
    end
  end
  
  local function StarFriend(Content, AvatarInfo)
    if not self.FriendData.Star then
      Content.Text = GText("UI_Friend_AddStar")
    else
      Content.Text = GText("UI_Friend_RemoveStar")
    end
    
    function Content.Callback()
      FriendController:SendRequest(FriendCommon.EventId.SetStar, AvatarInfo.Uid, not self.FriendData.Star)
      self.Head_Anchor:Close()
    end
  end
  
  local function RemoveFriend(Content, AvatarInfo)
    Content.Text = GText("UI_Friend_Remove")
    
    function Content.Callback()
      local Params = {
        RightCallbackFunction = function()
          FriendController:SendRequest(FriendCommon.EventId.DeleteFriend, AvatarInfo.Uid)
        end
      }
      UIManager(self):ShowCommonPopupUI(FriendCommon.DeleteDialog, Params, FriendMainView)
      self.Head_Anchor:Close()
    end
  end
  
  local Switch = {}
  if self.Type == FriendCommon.FriendDialogType.BlackList then
    Switch = {AddBlackList}
  elseif self.Type == FriendCommon.FriendTabType.MyFriend then
    Switch = {
      InitShowRecordBtn,
      RemarkFriend,
      StarFriend,
      AddBlackList,
      RemoveFriend
    }
  else
    Switch = {
      InviteTeam,
      InitShowRecordBtn,
      AddBlackList
    }
  end
  return ChatController:OpenPlayerBtnList(self, self.PersonData, Switch)
end

function M:OnBtnYesOrNoRelease(bYes)
  if bYes then
    FriendController:SendRequest(FriendCommon.EventId.AgreeAdd, self.RequestData.Uid)
  else
    FriendController:SendRequest(FriendCommon.EventId.RefuseAdd, self.RequestData.Uid)
  end
end

function M:OnBtnFunctionReleased()
  local Switch = {
    [FriendCommon.FriendTabType.MyFriend] = self.OnBtnFunctionReleased_MyFriend,
    [FriendCommon.FriendTabType.AddFriend] = self.OnBtnFunctionReleased_AddFriend,
    [FriendCommon.FriendTabType.RegionFriend] = self.OnBtnFunctionReleased_AddFriend
  }
  Switch[self.Type](self)
end

function M:OnBtnFunctionReleased_MyFriend()
  ChatController:OpenView(self)
  ChatController:SelectPlayerToChat(self.FriendData.Uid)
end

function M:OnBtnFunctionReleased_AddFriend()
  if self.Button_Funtion.IsForbidden then
    FriendController:ShowToast(GText("UI_Toast_Friend_AlreadyRequest"))
    return
  end
  local FriendMainView = FriendController:GetView(self)
  if not IsValid(FriendMainView) then
    return
  end
  FriendController:OpenAddFriendDialog(self, self.PersonData)
end

function M:OnBtnInviteReleased()
  local Switch = {
    [FriendCommon.FriendTabType.MyFriend] = self.OnBtnInviteReleased_MyFriend,
    [FriendCommon.FriendTabType.RecentMatch] = self.OnBtnInviteReleased_RecentMatch,
    [FriendCommon.FriendDialogType.BlackList] = self.OnBtnInviteReleased_BlackList
  }
  Switch[self.Type](self)
end

function M:OnBtnInviteReleased_RecentMatch()
  self:_InviteCommon(self.PersonData)
end

function M:OnBtnInviteReleased_MyFriend()
  self:_InviteCommon(self.FriendData.Info)
end

function M:_InviteCommon(AvatarInfo)
  if self.Button_Invite.IsForbidden then
    if TeamModel:GetInviteSendBox()[AvatarInfo.Uid] then
      TeamController:ShowToast(GText("UI_Team_InviteSend"))
      return
    end
    if TeamModel:IsMemberExist(AvatarInfo.Uid) then
      TeamController:ShowToast(GText("UI_Team_FriendInTeam"))
      return
    end
    if not AvatarInfo.IsOnline then
      TeamController:ShowToast(string.format(GText("UI_Team_PlayerOffline"), AvatarInfo.Nickname))
      return
    end
    if AvatarInfo.IsInDungeon then
      TeamController:ShowToast(GText("UI_Team_PlayerInDungeon"))
      return
    end
    if AvatarInfo.IsInSpecialQuest then
      TeamController:ShowToast(GText("UI_Team_PlayerInSpecaiDungeon"))
      return
    end
    return
  end
  TeamController:SendTeamInvite(AvatarInfo.Uid)
end

function M:OnBtnInviteReleased_BlackList()
  if self.Button_Invite.IsForbidden then
    return
  end
  FriendController:SendRequest(FriendCommon.EventId.CancelBlackList, self.PersonData.Uid)
end

function M:OnListItemObjectSet(Content)
  self:ResetUI()
  Content.UI = self
  self.Type = Content.Type
  self:SetRenderOpacity(1)
  local Switch = {
    [FriendCommon.FriendTabType.MyFriend] = self.OnListItemObjectSet_MyFriend,
    [FriendCommon.FriendTabType.AddFriend] = self.OnListItemObjectSet_AddFriend,
    [FriendCommon.FriendTabType.RecentMatch] = self.OnListItemObjectSet_RecentMatch,
    [FriendCommon.FriendTabType.RegionFriend] = self.OnListItemObjectSet_AddFriend,
    [FriendCommon.FriendDialogType.BlackList] = self.OnListItemObjectSet_BlackList,
    [FriendCommon.FriendDialogType.FriendRequest] = self.OnListItemObjectSet_FriendRequest,
    [FriendCommon.EmptyItem] = self.OnListItemObjectSet_Empty
  }
  Switch[self.Type](self, Content)
end

function M:OnAnimationFinished(Anim)
  if Anim == self.In then
    self:SetRenderOpacity(1)
  end
end

function M:_SetupBtnInvite()
  DebugPrint(DebugTag, LXYTag, "_SetupBtnInvite")
  self.Button_Invite:SetVisibility(UIConst.VisibilityOp.Visible)
  local Text, bForbid = "", false
  local AvatarInfo
  if self.Type == FriendCommon.FriendTabType.MyFriend then
    AvatarInfo = self.FriendData.Info
  elseif self.Type == FriendCommon.FriendDialogType.BlackList then
    Text = GText("UI_Friend_DelBlackList")
  elseif self.Type == FriendCommon.FriendTabType.RecentMatch then
    AvatarInfo = self.PersonData
  end
  if AvatarInfo then
    if TeamModel:GetInviteSendBox()[AvatarInfo.Uid] then
      Text, bForbid = GText("UI_Team_Invited"), true
    elseif TeamModel:IsMemberExist(AvatarInfo.Uid) then
      Text, bForbid = GText("UI_Team_InTeam"), true
    elseif not AvatarInfo.IsOnline then
      Text, bForbid = GText("UI_Friend_State_Offline"), true
    elseif AvatarInfo.IsInDungeon then
      Text, bForbid = GText("UI_Chat_InDungeon"), true
    elseif AvatarInfo.IsInSpecialQuest then
      Text, bForbid = GText("UI_Chat_InSpecialQuest"), true
    else
      Text = GText("UI_Friend_Invite")
    end
  end
  self.Button_Invite:SetText(Text)
  self.Button_Invite:ForbidBtn(bForbid)
end

function M:_SetupBtnFunction()
  if self.Type == FriendCommon.FriendTabType.MyFriend then
    self.Switcher_State:SetActiveWidgetIndex(0)
  elseif self.Type == FriendCommon.FriendTabType.AddFriend or self.Type == FriendCommon.FriendTabType.RegionFriend then
    local SendInfo = FriendModel:GetRequestSendBox()[self.PersonData.Uid]
    local FriendInfo = FriendModel:GetFriendDict()[self.PersonData.Uid]
    if FriendInfo or SendInfo and not SendInfo:IsExpired() then
      self.Switcher_State:SetActiveWidgetIndex(3)
      self.Button_Funtion:ForbidBtn(true)
    else
      self.Switcher_State:SetActiveWidgetIndex(1)
    end
  elseif self.Type == FriendCommon.FriendTabType.RecentMatch then
    self.Switcher_State:SetActiveWidgetIndex(1)
  end
  self.Button_Funtion:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:_SetRemarkName(Remark)
  self.Text_Remark:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Split:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Split_1:SetVisibility(UIConst.VisibilityOp.Visible)
  if not Remark or "" == Remark then
    self.Text_Remark:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Split_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.Text_Remark:SetText(Remark)
end

function M:_SetStar(bStar)
  local StarVisibilityTab = bStar and "Visible" or "Collapsed"
  self.Icon_Star:SetVisibility(UIConst.VisibilityOp[StarVisibilityTab])
end

function M:_SetHeadIcon(AvatarInfo)
  self.Head_Friend:SetHeadIconById(AvatarInfo.HeadIconId)
  self.Head_Friend:SetHeadFrame(AvatarInfo.HeadFrameId)
  self.Head_Friend:SetHoldUp(true)
end

function M:_SetOnlineState(IsOnline)
  self.HB_Loca:SetVisibility(UIConst.VisibilityOp.Visible)
  if not IsOnline then
    local OfflineDayMax = DataMgr.GlobalConstant.FriendOfflineDayMax.ConstantValue
    local Day = math.floor((TimeUtils.NowTime() - self.FriendData.Info.LastLogoutTime) / CommonConst.SECOND_IN_DAY)
    if Day < 1 or 0 == self.FriendData.Info.LastLogoutTime then
      self.Text_Loca:SetText(GText("UI_Friend_OffLineToday"))
    elseif OfflineDayMax >= Day then
      self.Text_Loca:SetText(string.format(GText("UI_Friend_OfflineNDay"), Day))
    elseif OfflineDayMax < Day then
      self.Text_Loca:SetText(GText("UI_Friend_OfflineOver30Day"))
    end
    self:PlayAnimation(self.OffLine)
  elseif not self.FriendData.Info.IsInDungeon then
    self.Text_Loca:SetText(GText("UI_Friend_Online"))
    self:PlayAnimation(self.OnLine)
  else
    self.Text_Loca:SetText(GText("UI_Chat_InDungeon"))
    self:PlayAnimation(self.OnMission)
  end
end

function M:_SetSign(SignText)
  if self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self.Icon_Message:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Icon_Message:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Type == FriendCommon.FriendDialogType.BlackList then
    self.Text_Intro:SetText(GText("UI_Friend_AlreadyBlacklist"))
    return
  end
  if not SignText or "" == SignText then
    self.Text_Intro:SetText(GText("UI_Friend_NoSignature"))
    return
  end
  self.Text_Intro:SetText(SignText)
end

function M:OnListItemObjectSet_MyFriend(Content)
  self.FriendData = Content.Data
  self.PersonData = self.FriendData.Info
  self.Text_Name:SetText(self.FriendData.Info.Nickname)
  self:_SetRemarkName(self.FriendData.Remark)
  self:_SetHeadIcon(self.FriendData.Info)
  UIUtils.SetTitle(self.Title, self.FriendData.Info)
  self.Num_Level:SetText(tostring(self.FriendData.Info.Level))
  self:_SetStar(self.FriendData.Star)
  self.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  self:_SetupBtnInvite()
  self:_SetupBtnFunction()
  self:_SetOnlineState(self.FriendData.Info.IsOnline)
  self:_SetSign(self.FriendData.Info.Signature)
  self.Key_Function:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
end

function M:OnListItemObjectSet_AddFriend(Content)
  self.PersonData = Content.Data
  self.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  self:_SetupBtnFunction()
  self.Text_Name:SetText(self.PersonData.Nickname)
  self.Num_Level:SetText(tostring(self.PersonData.Level))
  self:_SetHeadIcon(self.PersonData)
  UIUtils.SetTitle(self.Title, self.PersonData)
  self:_SetSign(self.PersonData.Signature)
  self.Key_Function:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
end

function M:OnListItemObjectSet_RecentMatch(Content)
  self.PersonData = Content.Data
  self.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Text_Name:SetText(self.PersonData.Nickname)
  self.Num_Level:SetText(tostring(self.PersonData.Level))
  self:_SetHeadIcon(self.PersonData)
  UIUtils.SetTitle(self.Title, self.PersonData)
  self:_SetupBtnInvite()
  self:_SetupBtnFunction()
  self:_SetSign(self.PersonData.Signature)
end

function M:OnListItemObjectSet_BlackList(Content)
  self.PersonData = Content.Data
  self.Text_Name:SetText(self.PersonData.Nickname)
  self.Num_Level:SetText(self.PersonData.Level)
  self:_SetHeadIcon(self.PersonData)
  UIUtils.SetTitle(self.Title, self.PersonData)
  self:_SetSign()
  self.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  self:_SetupBtnInvite()
end

function M:OnListItemObjectSet_FriendRequest(Content)
  self.RequestData = Content.Data
  self.PersonData = self.RequestData.Info
  self.Text_Name:SetText(self.PersonData.Nickname)
  self.Num_Level:SetText(self.PersonData.Level)
  self:_SetHeadIcon(self.PersonData)
  UIUtils.SetTitle(self.Title, self.PersonData)
  self:_SetSign(self.RequestData.Remark)
  self.HB_Button_Request:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnListItemObjectSet_Empty()
  self.Panel_Portrait:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.HB_Name:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.HB_Button_Request:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.HB_Intro:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  self.Button_Invite:UnBindEventOnReleased(self, self.OnBtnInviteReleased)
  self.Button_Funtion:UnBindEventOnReleased(self, self.OnBtnFunctionReleased)
  self.Button_Yes:UnBindEventOnReleased(self, self.OnBtnYesOrNoRelease)
  self.Button_No:UnBindEventOnReleased(self, self.OnBtnYesOrNoRelease)
  self.Head_Anchor.OnGetUserMenuContentEvent:Unbind()
  self.Head_Anchor.OnMenuOpenChanged:Remove(self, self.HeadMenuOpenChanged)
  self:PlayAnimation(self.Out)
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  M.Super.Destruct(self)
end

function M:SetGamepadIconVisibility(bShow)
  if bShow then
    self.No_GamePad:SetVisibility(UIConst.VisibilityOp.Visbile)
    self.Key_No:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Yes_GamePad:SetVisibility(UIConst.VisibilityOp.Visbile)
    self.Key_Yes:SetVisibility(UIConst.VisibilityOp.Visible)
    if self.Type ~= FriendCommon.FriendDialogType.BlackList then
      self.Key_Function:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Function_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
    else
      self.Key_Function:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Function_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Button_Invite:SetGamepadIconVisibility(true)
    self.Button_Talk:SetGamepadIconVisibility(true)
  else
    self.No_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_No:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Yes_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Yes:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Function_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Function:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Button_Invite:SetGamepadIconVisibility(false)
    self.Button_Talk:SetGamepadIconVisibility(false)
  end
end

function M:OnItemSelectionChanged(IsSelected)
  self.bIsSelected = IsSelected
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if IsSelected then
      self:SetGamepadIconVisibility(true)
      if self:IsAnimationPlaying(self.GamePad_Hover) then
        self:StopAnimation(self.GamePad_Hover)
      end
      self:PlayAnimation(self.GamePad_Hover)
      DebugPrint(DebugTag, "jly", "BP_OnItemSelectionChanged Hover", self.GamePad_Hover)
    else
      self:SetGamepadIconVisibility(false)
      if self:IsAnimationPlaying(self.GamePad_Hover) then
        self:StopAnimation(self.GamePad_Hover)
      end
      self:PlayAnimationReverse(self.GamePad_Hover)
      DebugPrint(DebugTag, "jly", "BP_OnItemSelectionChanged UnHover", self.GamePad_Hover)
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self:PlayAnimation(self.GamePad_Normal)
    self:SetGamepadIconVisibility(false)
    self.bIsSelected = false
  elseif CurInputDevice == ECommonInputType.Gamepad and self.bIsSelected then
    self:SetGamepadIconVisibility(true)
    self:PlayAnimation(self.GamePad_Hover)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if self.bMenuOpen then
    if "Gamepad_FaceButton_Right" == InKeyName then
      self.Head_Anchor:Close()
      self:SetFocus()
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if "Gamepad_FaceButton_Left" == InKeyName and self.Type == FriendCommon.FriendTabType.MyFriend then
    self:OnBtnFunctionReleased()
    IsHandled = true
  elseif "Gamepad_FaceButton_Bottom" == InKeyName and self.Type == FriendCommon.FriendTabType.AddFriend then
    self:OnBtnFunctionReleased()
    IsHandled = true
  elseif "Gamepad_FaceButton_Bottom" == InKeyName and self.Type == FriendCommon.FriendTabType.MyFriend then
    self:OnBtnInviteReleased()
    IsHandled = true
  elseif "Gamepad_FaceButton_Bottom" == InKeyName and self.Type == FriendCommon.FriendTabType.RegionFriend then
    self:OnBtnFunctionReleased()
    IsHandled = true
  elseif "Gamepad_FaceButton_Bottom" == InKeyName and self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self:OnBtnYesOrNoRelease(true)
    IsHandled = true
  elseif "Gamepad_FaceButton_Left" == InKeyName and self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self:OnBtnYesOrNoRelease(false)
    IsHandled = true
  elseif "Gamepad_FaceButton_Bottom" == InKeyName and self.Type == FriendCommon.FriendDialogType.BlackList then
    self:OnBtnInviteReleased()
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local ParentHandled = M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.SpecialLeft and not IsValid(ChatController:GetView(self)) then
    self.Head_Anchor:Open(true)
  end
  return ParentHandled
end

return M
