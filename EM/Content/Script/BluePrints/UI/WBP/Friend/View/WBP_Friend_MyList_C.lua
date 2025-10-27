require("UnLua")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendModel = FriendController:GetModel()
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Friend.View.Base.WBP_Friend_ListBase"
})

function M:OnTeamMainFocusChanged(bFocused)
  for _, Entry in pairs(self.MyListView:GetDisplayedEntryWidgets()) do
    Entry:OnTeamMainFocusChanged(bFocused)
  end
  local Visibility = bFocused and "Collapsed" or "SelfHitTestInvisible"
  local KeyWidgets = {
    self.WBP_Com_FilterSort.Controller,
    self.Button_BlackList.Key_GamePad,
    self.Button_Request.Key_GamePad,
    self.Key_GamePad
  }
  for _, KeyWidget in ipairs(KeyWidgets) do
    KeyWidget:SetVisibility(UIConst.VisibilityOp[Visibility])
  end
end

function M:Construct()
  M.Super.Construct(self)
  self.MyListView = self.List_MyFriend
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.WidgetSwitcher_OnLine:SetActiveWidgetIndex(0)
  self.Button_BlackList:SetText(GText("UI_Friend_BlackList"))
  self.Button_BlackList:SetGamePadImg("Left")
  self.Button_BlackList:BindEventOnReleased(self, self.OpenFriendDialogWindow, FriendCommon.FriendDialogType.BlackList)
  self.Button_Request:SetText(GText("UI_Friend_FriendRequest"))
  self.Button_Request:SetGamePadImg("Y")
  self.Button_Request:BindEventOnReleased(self, self.OpenFriendDialogWindow, FriendCommon.FriendDialogType.FriendRequest)
  self.Text_Add:SetText(GText("UI_Friend_GoToAdd"))
  self.Button_Area.OnClicked:Add(self, function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", "JumpToAddFriend", nil)
    self.Parent:SelectTab(FriendCommon.FriendTabType.AddFriend)
  end)
  self.Text_Empty:SetText(GText("UI_Friend_NoAnyFriend"))
  self.Text_Empty_OnLine:SetText(GText("UI_Friend_NoOnlineFriend"))
  self.Text_Friend:SetText(GText("UI_Friend_FriendCount"))
  self.Text_OnlineFriend:SetText(GText("UI_Friend_OnlineFriend"))
  self.CheckBox_Online:SetCheckedState(ECheckBoxState.Unchecked)
  self.CheckBox_Online.OnCheckStateChanged:Add(self, self.OnOnlineCheckBoxChange)
  local Filters = {
    "UI_Friend_OnlineTime",
    "UI_LEVEL_SELECT"
  }
  self.WBP_Com_FilterSort:Init(self, Filters, CommonConst.DESC, {
    OnGetBackFocusWidget = function()
      return self.MyListView
    end
  })
  self.WBP_Com_FilterSort:BindEventOnSelectionsChanged(self, self.OnFilterChanged)
  self.WBP_Com_FilterSort:BindEventOnSortTypeChanged(self, self.OnFilterChanged)
  self.Num_Limit:SetText(tostring(DataMgr.GlobalConstant.FriendHoldMax.ConstantValue))
  self.FuncIdx, self.SortType = 1, CommonConst.DESC
  ReddotManager.AddListener(FriendCommon.ReddotName, self, function(self, Count)
    local ReddotType = DataMgr.ReddotNode[FriendCommon.ReddotName].Type
    local IsNew = 1 == ReddotType and Count > 0
    local Upgradeable = 0 == ReddotType and Count > 0
    self.Button_Request:SetReddot(IsNew, Upgradeable)
    if Count > 0 then
      AudioManager(self):PlayUISound(self, "event:/ui/common/team_friend_recieve", nil, nil)
    end
  end)
  
  local function RefreshListOnly(bAnimation)
    self:RefreshList(bAnimation)
  end
  
  local function RefreshOneItemByUid(Uid)
    local Data = FriendModel:GetFriendDict()[Uid]
    if Data then
      self:RefreshListItem(Data)
    end
  end
  
  self.EventSwitch = {
    [FriendCommon.EventId.AgreeAdd] = RefreshListOnly,
    [FriendCommon.EventId.DeleteFriend] = RefreshListOnly,
    [FriendCommon.EventId.SetRemark] = RefreshOneItemByUid,
    [FriendCommon.EventId.SetStar] = RefreshListOnly,
    [FriendCommon.EventId.AddBlackList] = RefreshListOnly,
    [FriendCommon.EventId.AgreeAll] = RefreshListOnly,
    [FriendCommon.EventId.RefreshFriend] = function(ErrCode)
      if not self.bRefreshing then
        return
      end
      self.bRefreshing = false
      if ErrCode ~= ErrorCode.RET_SUCCESS then
        self:OnListEmpty()
      else
        self:RefreshList()
      end
    end,
    [FriendCommon.EventId.UpdateOneFriend] = function(Uid)
      if self.bRefreshing then
        return
      end
      RefreshOneItemByUid(Uid)
      self:OnRefreshListEnd()
    end
  }
  FriendController:RegisterEvent(self, function(self, EventId, ...)
    local SwitchFunc = self.EventSwitch[EventId]
    if not SwitchFunc then
      return
    end
    SwitchFunc(...)
  end)
  TeamController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == TeamCommon.EventId.TeamBeRefused then
      RefreshOneItemByUid(...)
    elseif EventId == TeamCommon.EventId.TeamOnAddPlayer then
      local MemberInfo = (...)
      RefreshOneItemByUid(MemberInfo.Uid)
    elseif EventId == TeamCommon.EventId.TeamOnDelPlayer then
      local MemberInfo = (...)
      RefreshOneItemByUid(MemberInfo.Uid)
    elseif EventId == TeamCommon.EventId.TeamLeave then
      local OldTeamData = (...)
      for _, Member in ipairs(OldTeamData.Members) do
        RefreshOneItemByUid(Member.Uid)
      end
    elseif EventId == TeamCommon.EventId.TeamInvite then
      RefreshOneItemByUid(...)
    elseif EventId == TeamCommon.EventId.TeamOnInit then
      local TeamData = (...)
      for _, Member in ipairs(TeamData.Members) do
        RefreshOneItemByUid(Member.Uid)
      end
    end
  end)
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self:AddInputMethodChangedListen()
  self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:OnFilterChanged()
  self.FuncIdx, self.SortType = self.WBP_Com_FilterSort:GetSortInfos()
  self:RefreshList()
end

function M:OnListEmpty()
  if self.bFilterOnline then
    self.WidgetSwitcher_OnLine:SetActiveWidgetIndex(1)
    self.WBP_Com_FilterSort:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  end
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
end

function M:OnRefreshListBegin()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.WidgetSwitcher_OnLine:SetActiveWidgetIndex(0)
  self.WBP_Com_FilterSort:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnOnlineCheckBoxChange(bChecked)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self.bFilterOnline = bChecked
  self:RefreshList()
end

function M:OpenFriendDialogWindow(DialogType)
  FriendController:OpenDialog(self, DialogType)
end

function M:JumpToAddFriend()
  self.Parent:SelectTab(FriendCommon.FriendTabType.AddFriend)
end

function M:GetListData()
  FriendModel:SortFriends(self.FuncIdx, self.SortType)
  local FriendList, FriendOnlineList = FriendModel:GetFriendList()
  if self.bFilterOnline then
    self.ListDatas = FriendOnlineList
  else
    self.ListDatas = FriendList
  end
end

function M:SetupListContent(Uid, NewContent)
  local Dict = FriendModel:GetFriendDict()
  local FriendData = Dict[Uid]
  NewContent.Data = FriendData
  NewContent.Type = FriendCommon.FriendTabType.MyFriend
end

function M:InitWidget(Parent)
  self.Parent = Parent
  self:RefreshList()
  self.bRefreshing = true
  FriendController:SendRequest(FriendCommon.EventId.RefreshFriend)
end

function M:OnRefreshListEnd()
  local FriendList, FriendOnlineList = FriendModel:GetFriendList()
  self.Num_OnlineFriend:SetText(#FriendOnlineList)
  self.Num_Friend:SetText(#FriendList)
  self:RefreshNavigationRule()
  if self:HasFocusedDescendants() or self:HasAnyUserFocus() or not FriendController:IsGamepad() then
    self.MyListView:SetFocus()
  end
end

function M:Destruct()
  self.Button_BlackList:UnBindEventOnReleased(self, self.OpenFriendDialogWindow)
  self.Button_Request:UnBindEventOnReleased(self, self.OpenFriendDialogWindow)
  self.Button_Area.OnClicked:Clear()
  self.CheckBox_Online.OnCheckStateChanged:Remove(self, self.OnOnlineCheckBoxChange)
  ReddotManager.RemoveListener(FriendCommon.ReddotName, self)
  FriendController:UnRegisterEvent(self)
  TeamController:UnRegisterEvent(self)
  self:ClearListItems()
  self:RemoveInputMethodChangedListen()
  M.Super.Destruct(self)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local ParentHandled = M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Top" == InKeyName then
    self:OpenFriendDialogWindow(FriendCommon.FriendDialogType.FriendRequest)
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", "JumpToAddFriend", nil)
    self.Parent:SelectTab(FriendCommon.FriendTabType.AddFriend)
  end
  return ParentHandled
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self:RefreshNavigationRule()
end

function M:OnAddedToFocusPath(InFocusEvent)
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(self.NavigateWidgetOpacity)
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if self.WBP_Com_FilterSort:HasAnyFocus() then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Left" == InKeyName then
      self:OpenFriendDialogWindow(FriendCommon.FriendDialogType.BlackList)
      IsHandled = true
    elseif "Gamepad_LeftThumbstick" == InKeyName then
      local GameInstance = GWorld.GameInstance
      local UIManager = GameInstance:GetGameUIManager()
      local FriendMain = UIManager:GetUIObj("FriendMain")
      if FriendMain then
        FriendMain:ShowCheckBtn(true)
      end
      self.WBP_Com_FilterSort:SetFocus()
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

return M
