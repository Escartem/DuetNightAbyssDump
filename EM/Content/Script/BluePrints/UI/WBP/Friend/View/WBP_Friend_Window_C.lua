require("UnLua")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendModel = FriendController:GetModel()
local UIUtils = require("Utils.UIUtils")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase",
  "BluePrints.UI.WBP.Friend.View.Base.WBP_Friend_ListBase"
})

function M:Construct()
  M.Super.Construct(self)
  self.MyListView = self.List
  self.Switcher_Content:SetActiveWidgetIndex(0)
  local Filters = {
    "UI_Friend_RequestTime"
  }
  
  local function CommonFunc(bAnimation)
    self:RefreshList(bAnimation)
  end
  
  self.EventSwitch = {
    [FriendCommon.EventId.AgreeAdd] = CommonFunc,
    [FriendCommon.EventId.RefuseAdd] = CommonFunc,
    [FriendCommon.EventId.CancelBlackList] = function(bAnimation)
      self:RefreshList(bAnimation)
    end,
    [FriendCommon.EventId.AgreeAll] = CommonFunc,
    [FriendCommon.EventId.RefuseAll] = CommonFunc
  }
  FriendController:RegisterEvent(self, function(self, Reason, ...)
    local SwitchFunc = self.EventSwitch[Reason]
    if not SwitchFunc then
      return
    end
    SwitchFunc(...)
  end)
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "FriendWindow", nil)
  self:AddInputMethodChangedListen()
  self:AddTimer(0.2, function()
    if self.ListDatas == nil or 0 == #self.ListDatas then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self:SetFocus()
    end
  end, false, 0, nil, true)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if FriendController:IsGamepad() then
    self:SetFocus()
    self:RefreshNavigationRule()
  end
end

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  self.Owner = Owner
  self.Params = Params
  self.Type = Params.Type
  self.IsRejectAll = false
  self:CollapseButtonBar()
  if Params.ButtonBarName then
    local Filters = {
      "UI_Friend_OnlineTime",
      "UI_LEVEL_SELECT"
    }
    self.Owner:GetButtonBar().WBP_Com_Sort:Init(self.Owner, Filters, self.SortType, {
      OnGetBackFocusWidget = function()
        return self.MyListView
      end
    })
    self.Owner:GetButtonBar().WBP_Com_Sort:BindEventOnSelectionsChanged(self, self.OnFilterChanged)
    self.Owner:GetButtonBar().WBP_Com_Sort:BindEventOnSortTypeChanged(self, self.OnFilterChanged)
    self.Owner:GetButtonBar().Btn_Yes:SetText(GText("UI_Friend_AcceptAll"))
    self.Owner:GetButtonBar().Btn_Quit:SetText(GText("UI_Friend_RejectAll"))
    self.Owner:GetButtonBar().Btn_Yes:BindEventOnClicked(self, self.OnBtnYesOrNoRelease, true)
    self.Owner:GetButtonBar().Btn_Quit:BindEventOnClicked(self, self.OnBtnYesOrNoRelease, false)
    self.Owner:GetButtonBar():SetVisibility(UIConst.VisibilityOp.Visible)
    self.Owner:GetButtonBar().Btn_Yes:SetGamePadImg("Right")
    self.Owner:GetButtonBar().Btn_Quit:SetGamePadImg("Left")
  else
    self:CollapseButtonBar()
  end
  self.MyListView:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Owner:GetTitle().HorizontalBox_1:SetVisibility(UIConst.VisibilityOp.Visible)
  if self.Type == FriendCommon.FriendDialogType.FriendRequest then
    FriendModel:CleanReddotCount()
  end
  self:_SetupTitle()
  self:RefreshList()
  self:_SetupLimit()
  if self.Type == FriendCommon.FriendDialogType.BlackList then
    self:CollapseButtonBar()
  end
  self.CheckBtnIndex = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Tips_Ensure")
  })
  self.PlayerInfoBtnIndex = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.SpecialLeft
      }
    },
    Desc = GText("UI_Controller_CheckPlayer")
  })
  self:ShowPlayerInfoBtn(0 ~= #self.ListDatas)
  self:ShowCheckBtn(false)
  self:SetFocus()
end

function M:PostInitContent(Params, PopupData, Owner)
  if self.Type == FriendCommon.FriendDialogType.BlackList then
    self:CollapseButtonBar()
  end
end

function M:OnBtnYesOrNoRelease(bYes)
  if bYes then
    FriendController:SendRequest(FriendCommon.EventId.AgreeAll)
  else
    local Params = {
      RightCallbackFunction = function()
        FriendController:SendRequest(FriendCommon.EventId.RefuseAll)
      end,
      CloseBtnCallbackFunction = function()
        self:Close()
        self:CollapseButtonBar()
      end,
      LeftCallbackFunction = function()
        self:Close()
        self:CollapseButtonBar()
      end
    }
    self.IsRejectAll = true
    self.Owner:OnCloseBtnClicked()
    UIManager(self):ShowCommonPopupUI(FriendCommon.RejectAllDialog, Params, self)
  end
end

function M:OnFilterChanged()
  self.FuncIdx, self.SortType = self.Owner:GetButtonBar().WBP_Com_Sort:GetSortInfos()
  self:RefreshList()
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, "FriendWindow", {ToEnd = 1})
  M.Super.Close(self)
end

function M:OnRefreshListBegin()
  self.Switcher_Content:SetActiveWidget(1)
  if self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self.Owner:GetButtonBar():SetVisibility(UIConst.VisibilityOp.Visible)
  elseif self.Type == FriendCommon.FriendDialogType.BlackList then
    local ButtonBar = self.Owner:GetButtonBar()
    if IsValid(ButtonBar) then
      ButtonBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:GetListData()
  self.ListDatas = {}
  if self.Type == FriendCommon.FriendDialogType.FriendRequest then
    FriendModel:SortFriendRequests(self.FuncIdx, self.SortType)
    self.ListDatas = FriendModel:GetFriendRequestList()
  elseif self.Type == FriendCommon.FriendDialogType.BlackList then
    for K, V in pairs(FriendModel:GetBlackListDict()) do
      table.insert(self.ListDatas, K)
    end
  end
end

function M:OnListEmpty()
  self.Switcher_Content:SetActiveWidgetIndex(1)
  self:CollapseButtonBar()
end

function M:CollapseButtonBar()
  local ButtonBar = self.Owner:GetButtonBar()
  if ButtonBar then
    ButtonBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetupListContent(Uid, Content)
  local Dict = {}
  if self.Type == FriendCommon.FriendDialogType.FriendRequest then
    Dict = FriendModel:GetRequestRecvBox()
  elseif self.Type == FriendCommon.FriendDialogType.BlackList then
    Dict = FriendModel:GetBlackListDict()
  end
  Content.Data = Dict[Uid]
  Content.Type = self.Type
end

function M:OnRefreshListEnd()
  self.Owner:GetTitle().Text_Num01:SetText(#self.ListDatas)
  self:_SetupBottom()
  self:RefreshNavigationRule()
  self:ShowPlayerInfoBtn(0 ~= #self.ListDatas)
  if 0 == #self.ListDatas then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  else
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  self.MyListView:SetFocus()
end

function M:_SetupBottom()
  if self.Type == FriendCommon.FriendDialogType.BlackList then
    self:CollapseButtonBar()
  elseif self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self.Switcher_Content:SetActiveWidgetIndex(1)
    if 0 == #self.ListDatas then
      return
    end
    self.Owner:GetButtonBar():SetVisibility(UIConst.VisibilityOp.Visible)
    self.Switcher_Content:SetActiveWidgetIndex(0)
  end
end

function M:_SetupLimit()
  if self.Type == FriendCommon.FriendDialogType.BlackList then
    self.Owner:GetTitle().Text_Num02:SetText("/" .. DataMgr.GlobalConstant.FriendBlockMax.ConstantValue)
  elseif self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self.Owner:GetTitle().Text_Num02:SetText("/" .. DataMgr.GlobalConstant.FriendBlockMax.ConstantValue)
  end
end

function M:_SetupTitle()
  if self.Type == FriendCommon.FriendDialogType.BlackList then
    self.Text_Empty:SetText(GText("UI_Friend_BlackListEmpty"))
  elseif self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self.Text_Empty:SetText(GText("UI_Friend_FriendRequestEmpty"))
  end
end

function M:Destruct()
  if self.Type == FriendCommon.FriendDialogType.FriendRequest then
    self.Owner:GetButtonBar().Btn_Yes:UnBindEventOnClicked(self, self.OnBtnYesOrNoRelease)
    self.Owner:GetButtonBar().Btn_Quit:UnBindEventOnClicked(self, self.OnBtnYesOrNoRelease)
  end
  if self.Type == FriendCommon.FriendDialogType.FriendRequest and not self.IsRejectAll then
    self:CollapseButtonBar()
  end
  FriendController:UnRegisterEvent(self)
  self:ClearListItems()
  self:RemoveInputMethodChangedListen()
  M.Super.Destruct(self)
end

function M:BP_GetDesiredFocusTarget()
  return self.List
end

function M:ShowPlayerInfoBtn(bShow)
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:ShowGamepadShortcut(self.PlayerInfoBtnIndex)
  else
    self:HideGamepadShortcut(self.PlayerInfoBtnIndex)
  end
end

function M:ShowCheckBtn(bShow)
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:ShowGamepadShortcut(self.CheckBtnIndex)
  else
    self:HideGamepadShortcut(self.CheckBtnIndex)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    local BtnBar = self.Owner and self.Owner:GetButtonBar()
    if "Gamepad_DPad_Left" == InKeyName then
      if BtnBar and BtnBar.Btn_Quit and BtnBar.Btn_Quit:IsVisible() then
        BtnBar.Btn_Quit:OnBtnClicked()
      end
      self:ShowPlayerInfoBtn(false)
      IsHandled = true
    elseif "Gamepad_DPad_Right" == InKeyName then
      if BtnBar.Btn_Yes and BtnBar.Btn_Yes:IsVisible() then
        BtnBar.Btn_Yes:OnBtnClicked()
      end
      self:ShowPlayerInfoBtn(false)
      IsHandled = true
    elseif "Gamepad_LeftThumbstick" == InKeyName then
      self.Owner:GetButtonBar().WBP_Com_Sort:SetFocus()
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

return M
