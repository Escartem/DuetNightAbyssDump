require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  M.Super:OnLoaded(...)
  self.ClueWidgets = {
    self.Clue_01,
    self.Clue_02,
    self.Clue_03,
    self.Clue_04,
    self.Clue_05,
    self.Clue_06
  }
  self.Type, self.Answers, self.NextAnswer, self.CurerntQuestionId = ...
  self:InitUI()
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInAnimationFinished
  })
  self:BindToAnimationFinished(self.Succeed, {
    self,
    self.OnSucceedAnimationFinished
  })
  self:BindToAnimationFinished(self.Failure, {
    self,
    self.OnResultAnimationFinished
  })
  self:BindToAnimationFinished(self.Ratiocinate_In, {
    self,
    self.OnInAnimationFinished
  })
  self:BindToAnimationFinished(self.Ratiocinate_Succeed, {
    self,
    self.OnResultAnimationFinished
  })
  self:BindToAnimationFinished(self.Ratiocinate_Failure, {
    self,
    self.OnResultAnimationFinished
  })
  self:BindToAnimationFinished(self.Succeed_Out, {
    self,
    self.OnResultAnimationFinished
  })
  for _, clueWidget in ipairs(self.ClueWidgets) do
    clueWidget:PlayAnimation(clueWidget.Normal)
  end
  self:SetFocus()
  self.Btn_Close.OnClicked:Add(self, self.OnBtnCloseClick)
  if self.NextAnswer then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    local DetectiveAnswerData = DataMgr.DetectiveAnswer[self.NextAnswer]
    self.Icon_Clue:SetBrushResourceObject(LoadObject(DetectiveAnswerData.Icon))
    self.Text_Name:SetText(GText(DetectiveAnswerData.Name))
    self.Text_Tip:SetText(GText("UI_Armory_ClickEmpty"))
    self.Key01:CreateCommonKey({
      KeyInfoList = {
        {ImgShortPath = "B", Type = "Img"}
      },
      bLongPress = false,
      Desc = GText("UI_AntiAliasing_Close")
    })
  end
  self.Text_Gain:SetText(GText("Minigame_Textmap_100303"))
end

function M:OnBtnCloseClick()
  if 1 == self.Type or 3 == self.Type then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local ReasoningUI = UIManager:GetUIObj("DetectiveMinigame")
    ReasoningUI:OnAssociteUIClose()
    self:Close()
  end
  DebugPrint("thy   self.CanClose JLy", self.CanClose)
  if self.CanClose or ModController:IsMobile() then
    self:PlayAnimation(self.Succeed_Out)
  end
end

function M:StartPlayInAnimation()
  self.WS_Type:SetRenderOpacity(0)
  AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_think_progress", nil, nil)
  if 0 == self.Type then
    self.Text_Success:SetText(GText("Minigame_Textmap_100321"))
    self:PlayAnimation(self.Ratiocinate_In)
  elseif 1 == self.Type then
    self.Text_Fail:SetText(GText("Minigame_Textmap_100322"))
    self:PlayAnimation(self.Ratiocinate_In)
  elseif 2 == self.Type then
    self:PlayAnimation(self.In)
    self.WS_Type:SetActiveWidgetIndex(0)
    self.Text_Success:SetText(GText("Minigame_Textmap_100318"))
  elseif 3 == self.Type then
    self:PlayAnimation(self.In)
    self.WS_Type:SetActiveWidgetIndex(1)
    self.Text_Fail:SetText(GText("Minigame_Textmap_100317"))
  end
end

function M:OnInAnimationFinished()
  self:SetFocus()
  self:UnbindAllFromAnimationFinished(self.In)
  self:UnbindAllFromAnimationFinished(self.Ratiocinate_In)
  if 0 == self.Type then
    self:PlayAnimation(self.Ratiocinate_Succeed)
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_think_success", nil, nil)
  elseif 1 == self.Type then
    self:PlayAnimation(self.Ratiocinate_Failure)
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_think_fail", nil, nil)
    for _, clueWidget in ipairs(self.ClueWidgets) do
      clueWidget:PlayAnimation(clueWidget.Failure)
    end
  elseif 2 == self.Type then
    self:PlayAnimation(self.Succeed)
    DebugPrint("thy   self.CanClose succeedStart JLy", self.CanClose)
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_think_success", nil, nil)
  elseif 3 == self.Type then
    self:PlayAnimation(self.Failure)
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_think_fail", nil, nil)
    for _, clueWidget in ipairs(self.ClueWidgets) do
      clueWidget:PlayAnimation(clueWidget.Failure)
    end
  end
end

function M:OnResultAnimationFinished()
  self:UnbindAllFromAnimationFinished(self.Failure)
  self:UnbindAllFromAnimationFinished(self.Ratiocinate_Succeed)
  self:UnbindAllFromAnimationFinished(self.Ratiocinate_Failure)
  self:UnbindAllFromAnimationFinished(self.Succeed_Out)
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local ReasoningUI = UIManager:GetUIObj("DetectiveMinigame")
  ReasoningUI.Clue_01.Btn_Click:SetFocus()
  if 0 == self.Type then
    ReasoningUI:OnDetectiveAniFinish(self.CurerntQuestionId)
  elseif 2 == self.Type then
    ReasoningUI:OnAssociateAniFinish(self.NextAnswer)
  end
  ReasoningUI:OnAssociteUIClose()
  self:Close()
end

function M:OnSucceedAnimationFinished()
  self:SetFocus()
  self:UnbindAllFromAnimationFinished(self.Succeed)
  self.CanClose = true
  DebugPrint("thy   self.CanClose succeedFinished JLy", self.CanClose)
end

function M:InitUI()
  self.WS_Type:SetActiveWidgetIndex(self.Type)
  for i = 1, #self.ClueWidgets do
    self.ClueWidgets[i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for i = 1, #self.Answers do
    local AnswerId = self.Answers[i]
    local DetectiveAnswerData = DataMgr.DetectiveAnswer[AnswerId]
    if DetectiveAnswerData and self.ClueWidgets[i] then
      local clueWidget = self.ClueWidgets[i]
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.AnswerId = AnswerId
      Content.Name = DetectiveAnswerData.Name
      Content.Detail = DetectiveAnswerData.Detail
      Content.Tips = DetectiveAnswerData.Tips
      Content.Icon = LoadObject(DetectiveAnswerData.Icon)
      Content.IsEmpty = false
      Content.CanMultiSelected = false
      Content.IsSingleSelected = false
      Content.IsMultiSelected = false
      Content.Parent = self
      Content.IsSumbit = false
      clueWidget:InitUIInfo(Content)
      clueWidget:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("thy    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self.IsSwitchDevice = true
  if ModController:IsMobile() then
    self.WS_Close:SetActiveWidgetIndex(0)
    return
  end
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    DebugPrint("thy   IsPC")
    self.WS_Close:SetActiveWidgetIndex(0)
  else
    DebugPrint("thy   IsGamePad")
    self.WS_Close:SetActiveWidgetIndex(1)
    self:SetFocus()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Right" == InKeyName then
    self:OnBtnCloseClick()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  self:OnBtnCloseClick()
end

return M
