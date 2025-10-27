local Component = {}

function Component:OnGamepadKeyDown(InKeyName)
  if "Gamepad_Special_Left" == InKeyName then
    if not self.Book:GetIsClueUi() then
      return
    end
    self.Book:OnClickButton()
    self.Btn_Associate.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    if not self.Book:GetIsClueUi() then
      return
    end
    self:OnClickButtonAssociate()
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.Book:GetIsClueUi() then
      self.Book:OnClickButton()
      self.Btn_Associate.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self:OnClickBackButton()
    end
  end
  self:AddTimer(0.1, function()
    self:RefreshTabGamepadIcon()
  end)
end

function Component:InitGamePadUI()
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  self.Btn_Associate.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Book.Btn_QaBook.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
end

function Component:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("thy    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self.IsSwitchDevice = true
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    DebugPrint("thy   IsPC")
    self:SwitchMainUIToPCOrMoble()
  elseif self.CurInputDeviceType == ECommonInputType.Gamepad then
    DebugPrint("thy   IsGamePad")
    self:SwitchMainUIToGamePad()
    self:SetDefaultFocus()
  end
end

function Component:SetDefaultFocus()
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  if self.IsClueEmpty then
    if self.Book:GetIsClueUi() then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self:SetFocus()
    else
      self.Book:SetFocus()
    end
  elseif self.Book:GetIsClueUi() then
    self.Clue_01.Btn_Click:SetFocus()
  else
    self.Book:SetFocus()
  end
end

function Component:SwitchMainUIToGamePad()
  if self.Book:GetIsClueUi() then
    self.Btn_Associate.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.Book.Btn_QaBook.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
  self:RefreshTabGamepadIcon()
end

function Component:SwitchMainUIToPCOrMoble()
  self.Btn_Associate.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Book.Btn_QaBook.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function Component:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 30
    local CurScrollOffset = self.Book.EMScrollBox_100:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - a, 0, self.Book.EMScrollBox_100:GetScrollOffsetOfEnd())
    self.Book.EMScrollBox_100:SetScrollOffset(ScrollOffset)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function Component:RefreshTabGamepadIcon()
  if ModController:IsMobile() then
    return
  end
  local keyInfos = {}
  if self.Book:GetIsClueUi() then
    if self.Book.EMScrollBox_100:GetScrollOffsetOfEnd() > 0 then
      table.insert(keyInfos, {
        "RV",
        GText("UI_CTL_Rougelike_SlideItems")
      })
    end
    if not self.IsClueEmpty then
      if 3 == self.CurrentReasoningState then
        table.insert(keyInfos, {
          "A",
          GText("UI_CTL_Select/Cancel")
        })
      end
      if 2 == self.CurrentReasoningState then
        if self.IsCommitAnswerMultiSelect then
          table.insert(keyInfos, {
            "A",
            GText("UI_CTL_Select/Cancel")
          })
        else
          table.insert(keyInfos, {
            "A",
            GText("UI_CTL_Select")
          })
        end
      end
    end
  end
  if self.Book:GetIsClueUi() then
    table.insert(keyInfos, {
      "B",
      GText("UI_Tips_Close")
    })
  else
    table.insert(keyInfos, {
      "A",
      GText("UI_CTL_Select")
    })
    table.insert(keyInfos, {
      "B",
      GText("Impression_UI_Back")
    })
  end
  self.Tab:UpdateBottomKeyInfo_Quick(keyInfos)
end

return Component
