require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.ButtonNum = 3
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil ~= GameMode and nil ~= GameState then
    if GameState.GameModeType == "Training" then
      self.FunctionsList = {
        self.TrainingOpenSetup,
        self.TrainingCharacterSkills,
        self.TrainingKillMonsters
      }
      self.Text_TrainingTitle:SetText(GText("UI_DUNGEON_DES_TRAINING_14"))
      self:SetButtons("Training")
      self.MyButton.OnClicked:Add(self, self.OnSwitchPanel)
    elseif GameState.GameModeType == "Trial" then
      self.FunctionsList = {
        self.TrainingCharacterSkills
      }
      self.Group_Btn:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.ButtonNum = 1
      self.Text_TrainingTitle:SetText(GText("UI_Esc_Skill"))
      self:SetButtons("Trial")
      self.MyButton.OnClicked:Add(self, self.TrainingCharacterSkills)
      self.Img_Icon.RenderTransform.Angle = 270
      self.Group_Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  self.IsPanelSwitchOn = false
  self:ClosePanel()
  if not UIUtils.IsMobileInput() then
    self.Key_TrainingTitle:CreateGamepadKey(UIConst.GamePadImgKey.SpecialLeft)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitGamepadView()
  self.Key_TrainingTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function M:InitKeyboardView()
  self.Key_TrainingTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnFocusLost(InFocusEvent)
  if self.IsPanelSwitchOn then
    if self.IsPressingButton then
      return
    else
      self.IsPanelSwitchOn = false
      self:ClosePanel()
    end
  end
end

function M:OnSwitchPanel()
  if self.IsPanelSwitchOn then
    self.IsPanelSwitchOn = false
    self:ClosePanel()
  else
    self.IsPanelSwitchOn = true
    self:SetFocus()
    self:OpenPanel()
  end
end

function M:SetButtons(Type)
  if "Training" == Type then
    for Index = 1, self.ButtonNum do
      local ComButton = self["WBP_Com_BtnText_" .. Index]
      ComButton:SetText(GText("UI_DUNGEON_DES_TRAINING_" .. Index))
      ComButton.Button_Area.OnPressed:Add(self, self.PressButton)
      ComButton.Button_Area.OnClicked:Add(self, self.FunctionsList[Index])
      local Font = ComButton.Text_Button.Font
      Font.Size = ComButton.TextTrainingSetting_M
      ComButton.Text_Button:SetFont(Font)
    end
  else
    local ComButton = self.WBP_Com_BtnText_1
    ComButton:SetText(GText("UI_DUNGEON_DES_TRAINING_2"))
    ComButton.Button_Area.OnPressed:Add(self, self.PressButton)
    ComButton.Button_Area.OnClicked:Add(self, self.FunctionsList[1])
    local Font = ComButton.Text_Button.Font
    Font.Size = ComButton.TextTrainingSetting_M
    ComButton.Text_Button:SetFont(Font)
    for Index = 1, 3 do
      local ComButton = self["WBP_Com_BtnText_" .. Index]
      ComButton:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:OpenPanel()
  self:PlayAnimation(self.In)
  for Index = 1, self.ButtonNum do
    local ComButton = self["WBP_Com_BtnText_" .. Index]
    ComButton:SetVisibility(ESlateVisibility.Visible)
  end
end

function M:ClosePanel()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  for Index = 1, self.ButtonNum do
    local ComButton = self["WBP_Com_BtnText_" .. Index]
    ComButton:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:TrainingOpenSetup()
  if self.Parent then
    self.Parent:TrainingOpenSetup()
    self:AfterClickButton()
  end
end

function M:TrainingCharacterSkills()
  if self.Parent then
    self.Parent:TrainingCharacterSkills()
    self:AfterClickButton()
  end
end

function M:TrainingKillMonsters()
  if self.Parent then
    self.Parent:TrainingKillMonsters()
    self:AfterClickButton()
  end
end

function M:PressButton()
  self.IsPressingButton = true
end

function M:AfterClickButton()
  self.IsPanelSwitchOn = false
  self:ClosePanel()
  self.IsPressingButton = false
end

return M
