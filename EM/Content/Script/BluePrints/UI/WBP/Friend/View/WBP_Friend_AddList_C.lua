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
    self.Com_Input.Group_ControllerChoose,
    self.Com_Input.Group_ControllerControl,
    self.Button_Refresh.Key_GamePad,
    self.Button_Search.Key_GamePad
  }
  for _, KeyWidget in ipairs(KeyWidgets) do
    KeyWidget:SetVisibility(UIConst.VisibilityOp[Visibility])
  end
end

function M:Construct()
  M.Super.Construct(self)
  self.MyListView = self.List_AddFriend
  self.Com_Input:Init({
    Owner = self,
    HintText = GText("UI_Friend_SearchHint"),
    bNeedPasteBtn = true,
    Events = {
      OnTextChanged = self.OnEditUidTextChanged
    }
  })
  FriendController:OverrideButtonSound(self.Button_Search, "event:/ui/common/click_btn_confirm", nil)
  self.Button_Search:BindEventOnReleased(self, self.OnSearchReleased)
  self.Button_Search:SetText(GText("UI_Friend_SearchBtn"))
  self.Button_Search:SetGamePadImg("Y")
  self.Button_Search:ForbidBtn(true)
  self.Bar_CD:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Bar_CD:SetPercent(1)
  FriendController:OverrideButtonSound(self.Button_Refresh, "event:/ui/common/team_friend_click_refresh", nil)
  self.Button_Refresh:BindEventOnReleased(self, self.OnRefreshReleased)
  self.Button_Refresh:SetText(GText("UI_Friend_RefreshBtn"))
  self.Button_Refresh:SetGamePadImg("Right")
  self.Text_Title:SetText(GText("UI_Friend_Interested"))
  self.bSearchState = false
  if FriendController.RefreshRecommandTimer then
    DebugPrint("Yklua RefreshRecommandTimer is running No Freshing")
  else
    FriendController:SendGetRecommandList()
  end
  FriendController:RegisterEvent(self, function(self, Reason, ...)
    if Reason == FriendCommon.EventId.Search then
      local Res = (...)
      if Res then
        self.bSearchState = true
        self:RefreshList(true)
      end
      self.Com_Input:FocusInputField()
    elseif Reason == FriendCommon.EventId.RecommandCdUpdate then
      self:OnRecommandCdUpdate(...)
    elseif Reason == FriendCommon.EventId.AddFriend then
      local Uid = (...)
      local Dict = {}
      if not self.bSearchState then
        Dict = FriendModel:GetRecommendDict()
      else
        Dict = FriendModel:GetSearchRes()
      end
      local Data = Dict[Uid]
      if not Data then
        assert(false, "FriendCommon.Reason.AddFriend::Data nil is impossible")
      end
      self:RefreshListItem(Data, false)
    elseif Reason == FriendCommon.EventId.GetRecommandList then
      self.bSearchState = false
      self:RefreshList(true)
    end
  end)
  self:AddInputMethodChangedListen()
end

function M:OnRefreshReleased()
  if self.Button_Refresh.IsForbidden then
    FriendController:ShowToast(GText("UI_Toast_Firend_RefreshCd"))
    return
  end
  self.Button_Refresh:ForbidBtn(true)
  self.Bar_CD:SetPercent(1)
  self.Bar_CD:SetVisibility(UIConst.VisibilityOp.Visible)
  FriendController:SendRequest(FriendCommon.EventId.GetRecommandList)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self.Com_Input.Text_Input:HasAnyUserFocus() then
    return UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Left" == InKeyName then
    self.Com_Input:SetFocus()
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnRecommandCdUpdate(IsEnd, Percent)
  if IsEnd then
    self.Bar_CD:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Button_Refresh:ForbidBtn(false)
  else
    self.Bar_CD:SetPercent(Percent)
    if not self.Button_Refresh.IsForbidden then
      self.Button_Refresh:ForbidBtn(true)
    end
    if self.Bar_CD:GetVisibility() ~= UIConst.VisibilityOp.Visible and not self.bSearchState then
      self.Bar_CD:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self:RefreshNavigationRule()
end

function M:OnSearchReleased()
  if self.Button_Search.IsForbidden then
    return
  end
  self.Com_Input.Text_Input:SelectAllText()
  local TempUid = tonumber(self.Com_Input:GetText(), 10)
  local ExtraData = {
    SoundEvent = "event:/ui/common/input_err"
  }
  if nil == TempUid then
    FriendController:ShowToast(GText("UI_Toast_Friend_InvalidUid"), nil, ExtraData)
    return
  end
  if TempUid == FriendController:GetAvatar().Uid then
    FriendController:ShowToast(GText("UI_Toast_Friend_SearchYourself"), nil, ExtraData)
    self.Com_Input:FocusInputField()
    return
  end
  FriendController:SendRequest(FriendCommon.EventId.Search, TempUid)
end

function M:OnRefreshListBegin()
  if self.bSearchState then
    self.Button_Refresh:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_Title:SetText(GText("UI_Friend_SearchResTitle"))
    self.Bar_CD:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Button_Refresh:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_Title:SetText(GText("UI_Friend_Interested"))
  end
end

function M:OnEditUidTextChanged(Text)
  if "" == Text then
    self.Button_Search:ForbidBtn(true)
    local OldSearchState = self.bSearchState
    self.bSearchState = false
    if OldSearchState ~= self.bSearchState then
      self:RefreshList(true)
    end
  else
    self.Button_Search:ForbidBtn(false)
  end
end

function M:Destruct()
  self.Button_Refresh:UnBindEventOnReleased(self, self.OnRefreshReleased)
  self.Button_Search:UnBindEventOnReleased(self, self.OnSearchReleased)
  FriendController:UnRegisterEvent(self)
  self:ClearListItems()
  self:RemoveInputMethodChangedListen()
  M.Super.Destruct(self)
end

function M:GetListData()
  local Dict = {}
  if not self.bSearchState then
    Dict = FriendModel:GetRecommendDict()
  else
    Dict = FriendModel:GetSearchRes()
  end
  self.ListDatas = {}
  for K, V in pairs(Dict) do
    table.insert(self.ListDatas, K)
  end
  if not self.bSearchState and not next(self.ListDatas) then
    self:OnRefreshReleased()
  end
end

function M:SetupListContent(Uid, Content)
  local Dict = {}
  if not self.bSearchState then
    Dict = FriendModel:GetRecommendDict()
  else
    Dict = FriendModel:GetSearchRes()
  end
  Content.Data = Dict[Uid]
  Content.Type = FriendCommon.FriendTabType.RegionFriend
end

function M:InitWidget(Parent)
  self.Parent = Parent
  self:RefreshList()
  self:SetKeyboardFocus()
  if FriendController.RefreshRecommandTimer then
    self:OnRecommandCdUpdate(false, 1)
  end
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local ParentHandled = M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_DPad_Right" == InKeyName then
    self:OnRefreshReleased()
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    self:OnSearchReleased()
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if self.Com_Input:GetText() ~= "" then
      self.Com_Input:OnDeleteBtnClicked()
    else
      self.Com_Input:OnPasteBtnClicked()
      self:OnEditUidTextChanged(self.Com_Input:GetText())
    end
  end
  return ParentHandled
end

function M:OnRefreshListEnd()
  self:RefreshNavigationRule()
  self.MyListView:SetFocus()
end

return M
