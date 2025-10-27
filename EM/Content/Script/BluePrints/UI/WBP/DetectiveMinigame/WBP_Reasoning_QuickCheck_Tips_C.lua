require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.NewAnwer = (...)
  self.MappingKeyName = "ItemDetail"
  DebugPrint("DetectiveMinigameTips NewAnwer: ", self.NewAnwer)
  self.Text_BookType:SetText(GText("Minigame_Textmap_100319"))
  local DetectiveAnswerData = DataMgr.DetectiveAnswer[self.NewAnwer]
  local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Common/T_Com_Reasoning.T_Com_Reasoning")
  local Material = self.Image_Type:GetDynamicMaterial()
  Material:SetTextureParameterValue("Mask", Icon)
  self.KeyText = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName(self.MappingKeyName))
  self.GamepadKeyTextList = UIUtils.GetIconListByActionName(self.MappingKeyName)
  self:ListenForInputAction(self.MappingKeyName, EInputEvent.IE_Pressed, true, {
    self,
    self.OnClickOpen
  })
  self.Com_KeyText:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.KeyText
      }
    }
  })
  self.Com_KeyAdd:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = self.GamepadKeyTextList[1]
      },
      {
        Type = "Img",
        ImgShortPath = self.GamepadKeyTextList[2]
      }
    }
  })
  self:BindEvents()
  self:InitInputMethodEvent()
  self:InitDeviceInfo()
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
end

function M:BindEvents()
  self.Btn_ClickPhone.OnClicked:Add(self, self.OnClickOpen)
end

function M:Destruct()
  self:UnbindEvents()
  self:StopListeningForInputAction(self.MappingKeyName, EInputEvent.IE_Pressed)
  self:RemoveInputMethodEvent()
  self.Super.Destruct(self)
end

function M:UnbindEvents()
  self.Btn_ClickPhone.OnClicked:Remove(self, self.OnClickOpen)
end

function M:OnLoaded(...)
  self.Super:OnLoaded(...)
  self.CloseTimer = self:AddTimer(2.5, self.Close, false, nil, nil, false)
  AudioManager(self):PlayUISound(self, "event:/ui/common/reward_light", nil, nil)
end

function M:OnClickOpen()
  UIManager(self):LoadUINew("DetectiveMinigame", self.NewAnwer)
end

function M:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:InitInputMethodEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RemoveInputMethodEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("WBP_Reasoning_QuickCheck_Tips_C RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  self.CurInputDevice = CurInputDevice
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Com_KeyAdd:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Com_KeyText:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Com_KeyText:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Com_KeyAdd:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

return M
