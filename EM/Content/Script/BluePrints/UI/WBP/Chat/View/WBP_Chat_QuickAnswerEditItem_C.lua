require("UnLua")
local StringUtils = require("Utils.StringUtils")
local ChatModel = ChatController:GetModel()
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn_Edit.OnClicked:Add(self, self.OnEditClicked)
  self.Btn_No:BindEventOnReleased(self, self.OnNoReleased)
  self.Btn_Yes:BindEventOnReleased(self, self.OnYesReleased)
  self.Com_Input_Light:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Com_Input_Light:Init({
    Owner = self,
    Events = {
      OnTextChanged = self.OnInputTextChanged
    },
    HintText = GText("UI_Chat_InputHint"),
    bLimitSpaces = true,
    TextLimit = DataMgr.GlobalConstant.ChatQuickMsgMaxLen.ConstantValue
  })
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Key_Edit:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      }
    })
    self.Key_EditNo:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          Owner = self
        }
      }
    })
    self.Key_EditYes:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
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

function M:Destruct()
  self.Btn_Edit.OnClicked:Remove(self, self.OnEditClicked)
  self.Btn_No:UnBindEventOnReleased(self, self.OnNoReleased)
  self.Btn_Yes:UnBindEventOnReleased(self, self.OnYesReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputModeSubsystem) then
      GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
    end
  end
end

function M:OnInputTextReleased()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_input_bar", nil, nil)
end

function M:OnInputTextChanged(Text)
  local TextTable = StringUtils.Utf8ToTable(Text)
  local MaxLen = DataMgr.GlobalConstant.ChatQuickMsgMaxLen.ConstantValue
  if MaxLen < #TextTable then
    TextTable = table.slice(TextTable, 1, MaxLen)
    self.Com_Input_Light:SetText(table.concat(TextTable))
  end
end

function M:OnNoReleased(bNotEnableRightBtn)
  self.Owner:ExitEditing()
  self.Text_Answer:SetText(self.Text)
  self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Group_Btn:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Answer:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Image_BG:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Bg_Border:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Com_Input_Light:HideTips()
  self.Com_Input_Light:SetVisibility(UIConst.VisibilityOp.Collapsed)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", nil, nil)
  self:UpdateUIStyleInPlatform()
  DebugPrint("quickAnswerEditItem_C :: OnNoReleased")
end

function M:OnYesReleased()
  self.Owner:ExitEditing()
  self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  ChatController:CheckTextValid(self.Com_Input_Light:GetText(), function(bValid, Text)
    if bValid then
      self.Text = Text
      if ChatModel:GetQuickMsgDatas()[self.Index] ~= Text then
        self.Owner.Changes[self.Index] = 1
        self.Owner:ForbidRightBtn(false)
      else
        self.Owner.Changes[self.Index] = nil
      end
      self:OnNoReleased()
    end
  end, function(bWarning, TipText)
    self.Com_Input_Light:ShowTips(TipText, bWarning and 2 or 1)
  end, {
    EmptyHint = GText("UI_Chat_NotSaveEmpty")
  })
  self:UpdateUIStyleInPlatform()
end

function M:OnEditClicked()
  self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_Btn:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Answer:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Image_BG:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Bg_Border:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Com_Input_Light:SetText(self.Text)
  self.Com_Input_Light:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Com_Input_Light:FocusInputField()
  self.Owner:OnEditingItem(self)
  self:UpdateUIStyleInPlatform()
  DebugPrint("quickAnswerEditItem_C :: OnEditClicked")
end

function M:Init(Owner, Index, Text)
  self.Owner = Owner
  self.Index = Index
  self.IsEnter = 1 == Index
  self.OriginText = Text or ChatModel:GetQuickMsgDatas()[Index]
  self.Text = self.OriginText
  self.Text_Num:SetText(string.format("0%s", Index))
  self.Text_Answer:SetText(self.Text)
  self.Com_Input_Light.DialogParams = self.Owner.Params
  self:PlayAnimation(self.In)
end

function M:IsChanged()
  return self.Text ~= self.OriginText
end

function M:Close()
  self:PlayAnimation(self.Out)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.IsEnter and self == self.Owner.CurrItem then
  else
    self:Select()
    self.Owner:OnSelectItem(self)
  end
  return UIUtils.Handle
end

function M:Select()
  self.IsEnter = true
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self:IsAnimationPlaying(self.In) then
    return UIUtils.Handle
  end
  self:UpdateUIStyleInPlatform()
  self:PlayAnimation(self.Hover)
end

function M:UnSelect()
  self.IsEnter = false
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self:IsAnimationPlaying(self.In) then
    return
  end
  self:UpdateUIStyleInPlatform()
  self:PlayAnimation(self.UnHover)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    if self.IsEnter then
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self:PlayAnimation(self.Hover)
        self:UpdateUIStyleInPlatform()
      end
      return
    elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self:PlayAnimation(self.UnHover)
      self:UpdateUIStyleInPlatform()
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if self.CurInputDeviceType == ECommonInputType.Gamepad and (self.Owner.IsEditting and self.Owner.CurrItem == self or not self.Owner.IsEditting and self.Owner.CurrSelectItem == self) then
    self.IsEnter = true
    self.Owner:OnContentFocusReceived()
  end
  self:UpdateUIStyleInPlatform()
end

function M:UpdateUIStyleInPlatform()
  local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad
  local IsEnter = IsGamepad and self.IsEnter
  local IsEditting = self.Btn_Edit:GetVisibility() == UIConst.VisibilityOp.Collapsed
  local IsShowEdit = IsEnter and not IsEditting
  self.Key_Edit:SetVisibility(IsShowEdit and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed)
  self.Group_Btn:SetVisibility(IsEditting and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed)
  local IsShowEditOp = IsEnter and IsEditting
  local Visibility = IsShowEditOp and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed
  self.Group_EditNo:SetVisibility(Visibility)
  self.Group_EditYes:SetVisibility(Visibility)
  if self.Owner and self.Owner.CurrEdittingItem == self then
    self.Owner:UpdateEdittingMode(IsEnter and IsEditting)
  end
  if IsEnter then
    self.Com_Input_Light:SetGamePadKey("X", "LS")
  else
    self.Com_Input_Light:SetGamePadKey()
  end
  if self.IsEnter and not IsGamepad then
    self.IsEnter = false
    if not self:IsAnimationPlaying(self.In) then
      self:PlayAnimation(self.UnHover)
    end
  end
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
  if InKeyName == Const.GamepadFaceButtonDown then
    if self.Btn_Edit:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
      self:OnEditClicked()
    else
      self:OnYesReleased()
      self:SetFocus()
    end
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonRight then
    local IsEditting = self.Btn_Edit:GetVisibility() == UIConst.VisibilityOp.Collapsed
    if IsEditting and self.IsEnter and not self.Com_Input_Light:HasFocusedDescendants() then
      self:OnNoReleased()
      IsEventHandled = true
    end
  elseif InKeyName == Const.GamepadFaceButtonLeft then
    if self.Owner.CurrItem == self and self.IsEnter then
      self.Com_Input_Light:FocusInputField()
      self.Owner:OnEditingItem(self)
    end
    IsEventHandled = true
  elseif InKeyName == Const.GamepadLeftThumbstick then
    if self.IsEnter then
      self.Com_Input_Light:OnDeleteBtnClicked()
    end
    IsEventHandled = true
  end
  return IsEventHandled
end

return M
