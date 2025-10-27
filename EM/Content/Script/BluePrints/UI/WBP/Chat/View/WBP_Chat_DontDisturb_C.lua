require("UnLua")
local ChatModel = ChatController:GetModel()
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.ChatChannelMute = GWorld:GetAvatar().ChatChannelMute
  self.List_Channel.OnCreateEmptyContent:Bind(self, function(self)
    return NewObject(UIUtils.GetCommonItemContentClass())
  end)
  self:InitItems()
  self.CommonDialogWindow = UIManager(self):GetUIObj("CommonDialog")
  self:AddTimer(0.1, function()
    self:LateInit()
  end)
  self.bHaveForbidden = true
  self:AddDispatcher("ComfirmDisturbClick", self, self.Save)
end

function M:LateInit()
  self:SetClickCallback()
  self.CommonDialogWindow:InitGamepadShortcut({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_CTL_On/Off")
  })
  self:SetOriginFocus()
end

function M:InitItems()
  self.Items = {}
  local ChannelDatas = DataMgr.Channel
  for index, Data in ipairs(ChannelDatas) do
    if index ~= ChatCommon.ChannelDef.SettlementOnline then
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Enable = 1 == self.ChatChannelMute[index]
      Content.ChannelName = GText(Data.Name)
      Content.ChannelId = Data.ChannelType
      Content.ChannelIcon = LoadObject(Data.Icon)
      Content.ClickCallback = self.UnLockSaveButton
      Content.ClickCallbackObj = self
      self.List_Channel:AddItem(Content)
      table.insert(self.Items, Content)
    end
  end
  self.List_Channel:RequestFillEmptyContent()
end

function M:Save()
  local ItemsTable = self.Items
  local Avatar = ChatModel:GetAvatar()
  for index, value in ipairs(ItemsTable) do
    if (value.UI.EnableNotDisturb and 1 or 0) == Avatar.ChatChannelMute[index] then
    elseif value.UI.EnableNotDisturb then
      Avatar:SetChatChannelMute(index)
    else
      Avatar:CancelChatChannelMute(index)
    end
  end
  UIManager(self):ShowUITip("CommonToastMain", GText("UI_PersonInfo_Saved"))
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if not self.bHaveForbidden then
      self:Save()
      self.CommonDialogWindow:OnCloseBtnClicked()
    else
      self.CommonDialogWindow:OnForbiddenRightBtnClicked()
    end
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:SetClickCallback()
  for index, value in ipairs(self.Items) do
    if value.UI then
      value.UI:SetClickCallback(self.CheckIsChange, self)
    else
      ScreenPrint("value.UI is nil")
    end
  end
end

function M:CheckIsChange()
  local bDifferent = false
  for index, value in ipairs(self.Items) do
    local UI = value.UI
    if UI.EnableNotDisturb ~= (1 == self.ChatChannelMute[index]) then
      bDifferent = true
      break
    end
  end
  if bDifferent then
    self:LockOrUnLockSaveButton(false)
  else
    self:LockOrUnLockSaveButton(true)
  end
end

function M:LockOrUnLockSaveButton(bLock)
  local CommonDialogWindow = UIManager(self):GetUIObj("CommonDialog")
  self.bHaveForbidden = bLock
  CommonDialogWindow:ForbidRightBtn(bLock)
end

function M:SetItemEnableHover(IsEnable)
  ScreenPrint("SetItemEnableHover" .. (IsEnable and "true" or "false"))
  local ItemsTable = self.Items
  for index, value in ipairs(ItemsTable) do
    if value.UI then
      value.UI:SetEnableHover(IsEnable)
    end
  end
end

function M:ClearHover()
  local ItemsTable = self.Items
  for index, value in ipairs(ItemsTable) do
    if value.UI then
      value.UI:PlayAnimation(value.UI.Normal)
    end
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.CurInputDeviceType = CurInputType
  if CurInputType == ECommonInputType.Gamepad then
    self:SetOriginFocus()
    self:SetItemEnableHover(true)
  else
    self:SetItemEnableHover(false)
  end
end

function M:InitGamepadView()
  self.CurInputDeviceType = ECommonInputType.Gamepad
  self:SetOriginFocus()
  self:SetItemEnableHover(true)
end

function M:InitKeyboardView()
  self.CurInputDeviceType = ECommonInputType.MouseAndKeyboard
  self:SetItemEnableHover(false)
  self:ClearHover()
  self:AddTimer(0.3, function()
    self:SetItemEnableHover(false)
    self:ClearHover()
  end)
end

function M:SetOriginFocus()
  if self.List_Channel:GetNumItems() > 0 then
    self.List_Channel:NavigateToIndex(0)
  end
end

return M
