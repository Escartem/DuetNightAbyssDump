require("UnLua")
local WBP_Cinematic_PC = Class("BluePrints.Story.Talk.UI.Common.WBP_Cinematic_Common")

function WBP_Cinematic_PC:OnLoaded(...)
  WBP_Cinematic_PC.Super.OnLoaded(self, ...)
  self:RefreshBaseInfo()
end

function WBP_Cinematic_PC:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_Cinematic_PC:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("WBP_Cinematic_PC:RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  self.IsGamePad = IsGamePad
  if IsGamePad then
    self:SetFocus()
  else
  end
  self.WBP_Story_PlayKey_P:UpdateKeyImg(IsGamePad)
end

function WBP_Cinematic_PC:OnPlayKeyActive()
  self.WBP_Story_PlayKey_P:OnActive()
end

function WBP_Cinematic_PC:OnPlayKeyDeactive()
  self.WBP_Story_PlayKey_P:OnDeactive()
end

function WBP_Cinematic_PC:InitPlayKey()
  self.WBP_Story_PlayKey_P:Init(self.IsGamePad)
end

return WBP_Cinematic_PC
