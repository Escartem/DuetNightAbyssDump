require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local SwitchEventIndex = {
  Mirror = 0,
  TurnBack = 1,
  Name = 2,
  Write = 3,
  Gender = 4,
  Enter = 5,
  WholeBody = 6,
  Female = 7,
  Male = 8
}
local StateEventIndex = {
  Mirror = 0,
  TurnBack = 1,
  Name = 2,
  Write = 3,
  Enter = 4,
  WholeBody = 5,
  Female = 6,
  Male = 7
}

function M:Init()
  self.NowState = StateEventIndex.Enter
  self.Btn_Continue:BindEventOnClicked(self, self.OnClickButtonNext)
  self.Btn_Continue:SetText(GText("UI_REGISTER_CONTINUE"))
  if self.RootPage.SelectNodeType ~= "Current" then
    self.Text_Desc:SetText(GText("Prologue_ChooseDreamOne"))
  else
    self.Text_Desc:SetText(GText("Prologue_ChooseMoonhunter"))
  end
  self.bCanClickButton = true
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  if not self.DeviceInPc then
    self.Btn_Back:BindEventOnClicked(self, self.OnClickButtonObserve)
    self.Btn_Back:SetText(GText("UI_REGISTER_BACK"))
    self.Btn_Back:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Btn_male.OnClicked:Add(self, self.OnClickButtonMale)
  self.Btn_male.OnReleased:Add(self, self.OnReleaseButtonMale)
  self.Btn_female.OnClicked:Add(self, self.OnClickButtonFemale)
  self.Btn_female.OnReleased:Add(self, self.OnReleaseButtonFemale)
  if self.DeviceInPc then
  else
  end
  self.Text_Forbidden:SetText(GText("UI_REGISTER_COMINGSOON"))
  self:SaveButtonStyle()
  self.NowRole = ""
  self.Lock_Female:SetVisibility(ESlateVisibility.Collapsed)
  self.Lock_Male:SetVisibility(ESlateVisibility.Collapsed)
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:SetVisibility(4)
    end
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      self:SetVisibility(3)
    end
  })
end

function M:CreateMobileKeyAndLogic(Key, Text, Logic)
  Key:BindEventOnClicked(self, Logic)
end

function M:ForbidCanClick(Time)
  self.bCanClickButton = false
end

function M:UnlockCanClick()
  self.bCanClickButton = true
end

function M:OnReleaseButtonMale()
  self:PlayAnimation(self.Unhover_Male)
end

function M:OnReleaseButtonFemale()
  self:PlayAnimation(self.Unhover_Female)
end

function M:OnClickButton(EventIndex)
  self:StopAnimation(self.Forbidden)
  EventManager:FireEvent(EventID.OnSelectRole, EventIndex)
end

function M:ChangeRoleBtnStyle(SelectRole)
  local OtherRole = "Female"
  if "Female" == SelectRole then
    OtherRole = "Male"
  end
  print(_G.LogTag, "LXZ ChangeRoleBtnStyle", SelectRole, OtherRole, self.NowRole)
  self["Btn_" .. SelectRole].WidgetStyle.Normal = self["Press" .. SelectRole .. "BtnStyle"]
  self["Btn_" .. SelectRole].WidgetStyle.Hovered = self["Press" .. SelectRole .. "BtnStyle"]
  self["Btn_" .. OtherRole].WidgetStyle.Normal = self["Normal" .. OtherRole .. "BtnStyle"]
  self["Btn_" .. OtherRole].WidgetStyle.Hovered = self["Hovered" .. OtherRole .. "BtnStyle"]
  self:PlayAnimation(self["Normal_" .. OtherRole])
  if self.RootPage.PageState == "SelectRole" then
    self:PlayAnimation(self["Select_" .. SelectRole])
  end
  if "Female" == SelectRole and "Female" ~= self.NowRole then
    self:StopAnimation(self.Change_FtoM)
    self:PlayAnimation(self.Change_MtoF)
    AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_role_exchange", nil, nil)
  elseif "Male" == SelectRole and "Female" == self.NowRole then
    self:StopAnimation(self.Change_MtoF)
    self:PlayAnimation(self.Change_FtoM)
    AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_role_exchange", nil, nil)
  end
end

function M:OnClickButtonFemale()
  if not self.bCanClickButton or not self.RootPage.bCanChangeRole then
    return
  end
  if self.NowRole == "Female" then
    self:OnClickButtonObserve()
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_role_select", nil, nil)
    if self.RootPage.DeviceInPc then
      self.RootPage.Key_Observe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.WS_Button:SetActiveWidgetIndex(1)
    if not self.DeviceInPc then
      self.Btn_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Btn_Back:SetRenderOpacity(1)
    end
    self:ChangeRoleBtnStyle("Female")
    self.NowRole = "Female"
    self.NowState = StateEventIndex.Female
    self:OnClickButton(SwitchEventIndex.Female)
  end
end

function M:OnClickButtonMale()
  if not self.bCanClickButton or not self.RootPage.bCanChangeRole then
    return
  end
  if self.NowRole == "Male" then
    self:OnClickButtonObserve()
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_role_select", nil, nil)
    if self.RootPage.DeviceInPc then
      self.RootPage.Key_Observe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.WS_Button:SetActiveWidgetIndex(1)
    if not self.DeviceInPc then
      self.Btn_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Btn_Back:SetRenderOpacity(1)
    end
    self:ChangeRoleBtnStyle("Male")
    self.NowRole = "Male"
    self.NowState = StateEventIndex.Male
    self:OnClickButton(SwitchEventIndex.Male)
  end
end

function M:OnClickButtonBack()
  self.NowState = StateEventIndex.WholeBody
  if self.RootPage.IsGM then
    self:OnClickButton(SwitchEventIndex.WholeBody)
  else
    self:OnClickButton(SwitchEventIndex.WholeBody)
  end
end

function M:OnClickButtonTurnAround()
  if not self.bCanClickButton then
    return
  end
  self:StopAnimation(self.Forbidden)
  self.Text_Forbidden:SetRenderOpacity(0)
  if self.NowState == StateEventIndex.WholeBody then
    self.NowState = StateEventIndex.TurnBack
    self:OnClickButton(SwitchEventIndex.TurnBack)
  elseif self.NowState == StateEventIndex.TurnBack then
    self.NowState = StateEventIndex.WholeBody
    self:OnClickButton(SwitchEventIndex.WholeBody)
  end
end

function M:OnClickButtonObserve()
  if self.RootPage.IsGM then
    self:OnClickButton(SwitchEventIndex.Enter)
  else
    if not self.bCanClickButton then
      return
    end
    self:StopAnimation(self.Forbidden)
    self.Text_Forbidden:SetRenderOpacity(0)
    if self.NowState ~= StateEventIndex.WholeBody then
      self.NowState = StateEventIndex.WholeBody
      self:OnClickButton(SwitchEventIndex.WholeBody)
      self.Btn_female.WidgetStyle.Normal = self.NormalFemaleBtnStyle
      self.Btn_female.WidgetStyle.Hovered = self.HoveredFemaleBtnStyle
      self.Btn_male.WidgetStyle.Normal = self.NormalMaleBtnStyle
      self.Btn_male.WidgetStyle.Hovered = self.HoveredMaleBtnStyle
      self:PlayAnimation(self.Normal_Female)
      self:PlayAnimation(self.Normal_Male)
      if self.NowRole == "Female" then
        self:PlayAnimation(self.Change_FtoM)
        AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_role_exchange", nil, nil)
      end
      self.WS_Button:SetActiveWidgetIndex(0)
      if not self.DeviceInPc then
        self.Btn_Back:SetRenderOpacity(0)
      end
      self.NowRole = ""
      self.RootPage:OnBackToFullBody()
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_role_disselect", nil, nil)
  end
end

function M:OnClickButtonNext()
  if not self.bCanClickButton then
    return
  end
  if self.NowState ~= StateEventIndex.Male and self.NowState ~= StateEventIndex.Female then
    return
  end
  if self.RootPage.DeviceInPc then
    self.RootPage.Key_Observe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.RootPage.Key_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.RootPage:ChangeWidget("SelectName")
end

function M:OnClickButtonFullBody(Tag)
  if "L" == Tag then
    self:OnClickButtonMale()
  else
    self:OnClickButtonFemale()
  end
end

function M:OnClickButtonDetail(Tag)
  if "L" == Tag then
  elseif self.NowState == StateEventIndex.Female or self.NowState == StateEventIndex.Name then
    self:OnClickButtonMale()
  elseif self.NowState == StateEventIndex.Male or self.NowState == StateEventIndex.Name then
    self:OnClickButtonFemale()
  end
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  if "Gamepad_FaceButton_Right" == InKeyName or "Escape" == InKeyName then
    if self.NowState ~= StateEventIndex.WholeBody and self.NowState ~= StateEventIndex.Enter then
      self.RootPage:OnBackToFullBody()
      self:OnClickButtonObserve()
    end
  elseif "Gamepad_FaceButton_Bottom" == InKeyName then
    if self.NowState ~= StateEventIndex.WholeBody and self.NowState ~= StateEventIndex.Enter then
      self:OnClickButtonNext()
    end
  elseif "Gamepad_LeftShoulder" == InKeyName then
    if self.NowState == StateEventIndex.WholeBody or self.NowState == StateEventIndex.Enter then
      self.RootPage:OnClickButtonFullBody()
      self:OnClickButtonMale()
    end
  elseif "Gamepad_RightShoulder" == InKeyName then
    if self.NowState == StateEventIndex.WholeBody or self.NowState == StateEventIndex.Enter then
      self.RootPage:OnClickButtonFullBody()
      self:OnClickButtonFemale()
    elseif self.NowState == StateEventIndex.Female then
      self:OnClickButtonMale()
    elseif self.NowState == StateEventIndex.Male then
      self:OnClickButtonFemale()
    end
  end
  return true
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    if self.NowState ~= StateEventIndex.Enter and self.NowState ~= StateEventIndex.WholeBody then
      self.Btn_Continue:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.Btn_Continue:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == ECommonInputType.Touch and self.NowState ~= StateEventIndex.Enter and self.NowState ~= StateEventIndex.WholeBody then
    self.Btn_Continue:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return M
