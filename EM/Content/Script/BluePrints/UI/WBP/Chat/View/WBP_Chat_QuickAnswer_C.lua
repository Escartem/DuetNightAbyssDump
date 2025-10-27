require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn_Edit:BindEventOnClicked(self, self.OnBtnClicked)
end

function M:OnBtnClicked()
  local Params = {
    OnDialogCloseCallback = function()
    end,
    DontCloseWhenRightBtnClicked = true,
    ForbidRightBtn = true
  }
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  UIManager(self):ShowCommonPopupUI(ChatCommon.QuickMsgEditDialog, Params, self.Owner)
end

function M:Destruct()
  self.Btn_Edit:UnBindEventOnClicked(self, self.OnBtnClicked)
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputModeSubsystem) then
      GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
    end
  end
end

function M:Open(Owner, ViewName)
  self:PlayAnimation(self.In)
  self.Owner = Owner
  self.ViewName = ViewName
  local Index = 1
  self.Text_QuickAnswerTitle:SetText(GText("UI_COMMONPOP_TITLE_100091"))
  self.Group_QuickMsg:ClearListItems()
  for i = 0, self.Col - 1 do
    for j = 0, self.Row - 1 do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Index = Index
      Content.Owner = self
      self.Group_QuickMsg:AddItem(Content)
      Index = Index + 1
    end
  end
  self.Group_QuickMsg:NavigateToIndex(0)
  self:UpdateWidth()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Key_Edit:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Menu",
          Owner = self
        }
      }
    })
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputModeSubsystem) then
      GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
      self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
      self:UpdateUIStyleInPlatform()
    end
  end
end

function M:UpdateWidth()
  self.Root:SetWidthOverride(self.Owner:GetWidthOverrideForInput())
end

function M:Close()
  self.Owner:OnExtraPanelClose()
  self:PlayAnimation(self.Out)
end

function M:OnItemClick(QuickMsgText)
  self.Owner:ApplyQuickMsg(QuickMsgText)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateUIStyleInPlatform()
end

function M:UpdateUIStyleInPlatform()
  local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad
  local Visibility = IsGamepad and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed
  self.Key_Edit:SetVisibility(Visibility)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadSpecialRight then
    IsEventHandled = true
    self:OnBtnClicked()
  elseif InKeyName == Const.GamepadFaceButtonRight then
    IsEventHandled = true
    self.Owner.Com_Input:FocusInputField()
  end
  return IsEventHandled
end

return M
