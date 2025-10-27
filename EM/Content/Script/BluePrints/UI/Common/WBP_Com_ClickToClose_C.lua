require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
end

function M:Destruct()
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self.Text_Tip:SetText(GText(ConfigData.TextTip))
  self:InitGamepadKey(ConfigData.GamepadKeyName)
  self:RefreshBaseInfo()
  self:InitListenEvent()
end

function M:InitGamepadKey(GamepadKeyName)
  if GamepadKeyName then
    self.GamepadKeyName = GamepadKeyName
  else
    self.GamepadKeyName = "B"
  end
  self.GamepadKey = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyImg.WBP_Com_KeyImg", false)
  self.GamepadKey:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = self.GamepadKeyName
      }
    }
  })
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == UE4.ECommonInputType.Gamepad then
    self.WS_Type:SetActiveWidgetIndex(1)
  else
    self.WS_Type:SetActiveWidgetIndex(0)
  end
end

return M
