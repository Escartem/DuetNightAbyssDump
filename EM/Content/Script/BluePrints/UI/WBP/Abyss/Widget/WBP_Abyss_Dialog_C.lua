require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
end

function M:InitContent(Params, PopupData, Owner)
  local ConfigData = Params.ConfigData
  self.TabConfigDatas = Params.TabConfigDatas
  self.ConfigData = ConfigData
  self.Owner = Owner
  self.CurrentTab = nil
  self:BindDialogEvent(DialogEvent.OnTitleTabSelected, self.OnTabSelected)
  self.Items = ConfigData.Items
  self.Text_Total:SetText(GText(ConfigData.Text_Total))
  self.Text_Num:SetText(tostring(ConfigData.NowNum))
  self.Text_NumMax:SetText(tostring(ConfigData.NumMax))
  if not ConfigData.ShowIcon then
    self.Img_Star:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Img_Star:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.BtnReward:SetText(GText(ConfigData.ReceiveButtonText))
  self.BtnReward:SetDefaultGamePadImg("X")
  self.BtnReward:UnBindEventOnClickedByObj(self)
  self.BtnReward:BindEventOnClicked(self, function()
    ConfigData.ReceiveAllParam.SelfWidget = self
    ConfigData.ReceiveAllCallBack(self, ConfigData.ReceiveAllParam)
  end)
  self:InitItem(ConfigData)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self:AddInputMethodChangedListen()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  end
end

function M:InitItem(ConfigData)
  self.List_Item:ClearListItems()
  if 1 == ConfigData.SortType then
    self:SortItems()
  end
  local Count = 0
  for _, Item in pairs(ConfigData.Items) do
    local ClassPath = UIUtils.GetCommonItemContentClass()
    local MenuContent = NewObject(ClassPath)
    MenuContent.Owner = self
    MenuContent.ConfigData = Item
    MenuContent.Id = _ - 1
    if Item.CanReceive then
      Count = Count + 1
    end
    self.List_Item:AddItem(MenuContent)
  end
  if 2 == ConfigData.SortType then
    self:AddTimer(0.01, function()
      local AllItemCount = self.List_Item:GetNumItems()
      local MaxCount = UIUtils.GetListViewContentMaxCount(self.List_Item)
      local IndexToScroll = 0
      for i = 0, AllItemCount - 1 do
        local Item = self.List_Item:GetItemAt(i)
        if Item.ConfigData.CanReceive then
          self.MaxRewardGot = i
          self:AddTimer(0.1, function()
            self.List_Item:ScrollIndexIntoView(i)
          end)
          return
        elseif not Item.ConfigData.RewardsGot and 0 == IndexToScroll then
          IndexToScroll = i
        end
      end
      self.List_Item:ScrollIndexIntoView(IndexToScroll)
    end, false, 0, nil, true)
  end
  if Count > 0 then
    self.BtnReward:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.BtnReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SortItems()
  if not self.Items then
    return
  end
  table.sort(self.Items, function(a, b)
    if a.CanReceive and not b.CanReceive then
      return true
    elseif not a.CanReceive and b.CanReceive then
      return false
    elseif a.RewardsGot and not b.RewardsGot then
      return false
    elseif not a.RewardsGot and b.RewardsGot then
      return true
    end
    return a.SourceNum < b.SourceNum
  end)
end

function M:RefreshBaseInfo()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:InitKeyBoardView()
  else
    self:InitGamepadView()
  end
end

function M:InitGamepadView()
  self.List_Item:SetFocus()
  self.IsInViewMode = false
  self.BtnReward:SetGamePadIconVisible(true)
  if self.BtnReward:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    self.BtnReward:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  self:ShowGamepadViewBtn(true)
  self:ShowGamepadViewSingleBtn(false)
end

function M:InitKeyBoardView()
  self.BtnReward:SetGamePadIconVisible(false)
  if self.BtnReward:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    self.BtnReward:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self:ShowGamepadViewBtn(false)
  self:ShowGamepadViewSingleBtn(false)
end

function M:ShowGamepadScrollBtn(bShow)
  if bShow then
    if self.GamepadScrollBtnIndex then
      if self.Owner:GetGamepadShortcutByIndex(self.GamepadScrollBtnIndex) then
        self:ShowGamepadShortcut(self.GamepadViewBtnIndex)
      end
      return
    end
    self.GamepadScrollBtnIndex = self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("LV", self.CurGamepadName)
        }
      },
      Desc = GText("UI_Controller_Slide")
    })
  elseif self.GamepadScrollBtnIndex then
    self:HideGamepadShortcut(self.GamepadScrollBtnIndex)
    self.GamepadScrollBtnIndex = nil
  end
end

function M:ShowGamepadViewBtn(bShow)
  if bShow then
    if self.GamepadViewBtnIndex then
      if self.Owner:GetGamepadShortcutByIndex(self.GamepadViewBtnIndex) then
        self:ShowGamepadShortcut(self.GamepadViewBtnIndex)
      end
      return
    end
    self.GamepadViewBtnIndex = self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_Controller_CheckReward")
    })
  elseif self.GamepadViewBtnIndex then
    self:HideGamepadShortcut(self.GamepadViewBtnIndex)
    self.GamepadViewBtnIndex = nil
  end
end

function M:ShowGamepadViewSingleBtn(bShow)
  if bShow then
    if self.GamepadViewSingleBtnIndex then
      if self.Owner:GetGamepadShortcutByIndex(self.GamepadViewSingleBtnIndex) then
        self:ShowGamepadShortcut(self.GamepadViewSingleBtnIndex)
      end
      return
    end
    self.GamepadViewSingleBtnIndex = self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_CheckDetails")
    })
  elseif self.GamepadViewSingleBtnIndex then
    self:HideGamepadShortcut(self.GamepadViewSingleBtnIndex)
    self.GamepadViewSingleBtnIndex = nil
  end
end

function M:RefreshButton(CanReceiveAll)
  if not CanReceiveAll then
    self.BtnReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.BtnReward:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:OnTabSelected(TabWidget)
  if self.TabConfigDatas and self.TabConfigDatas[TabWidget.Idx] then
    self:Refresh(self.TabConfigDatas[TabWidget.Idx])
  end
end

function M:Refresh(ConfigData)
  self.Items = ConfigData.Items
  self.Text_Total:SetText(GText(ConfigData.Text_Total))
  self.Text_Num:SetText(tostring(ConfigData.NowNum))
  self.Text_NumMax:SetText(tostring(ConfigData.NumMax))
  if not ConfigData.ShowIcon then
    self.Img_Star:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Img_Star:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.BtnReward:SetText(GText(ConfigData.ReceiveButtonText))
  self.BtnReward.Button_Area.OnClicked:Clear()
  self.BtnReward.Button_Area.OnClicked:Add(self, function()
    ConfigData.ReceiveAllParam.SelfWidget = self
    ConfigData.ReceiveAllCallBack(self, ConfigData.ReceiveAllParam)
  end)
  self:InitItem(ConfigData)
end

function M:OnNavigateUp(Content)
  local Id = Content.Id - 1
  if Id >= 0 then
    local Item = self.List_Item:GetItemAt(Id)
    self.List_Item:NavigateToIndex(Id)
    Item.SelfWidget:SetFocus()
  end
end

function M:OnNavigateDown(Content)
  local Id = Content.Id + 1
  local AllItemCount = self.List_Item:GetNumItems() - 1
  if Id <= AllItemCount then
    local Item = self.List_Item:GetItemAt(Id)
    self.List_Item:NavigateToIndex(Id)
    Item.SelfWidget:SetFocus()
  end
end

function M:AddInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Destruct()
  self:RemoveInputMethodChangedListen()
  self.Super.Destruct(self)
end

function M:OnMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if bIsOpen then
      self:UpdateUIStyle(false)
    else
      self:UpdateUIStyle(true)
    end
  end
end

function M:UpdateUIStyle(IsVisible)
  if IsVisible then
    if self.Owner then
      self:ShowGamepadShortcut(self.Owner.GamepadCloseBtnIndex)
      self:ShowGamepadViewSingleBtn(true)
    end
  elseif self.Owner then
    self.Owner:HideAllGamepadShortcut()
  end
end

function M:ChangeCloseShortKeyText(Text)
  local Key = self.Owner:GetGamepadShortcutByIndex(self.Owner.GamepadCloseBtnIndex)
  if Key then
    Key:SetDescription(Text)
  end
end

return M
