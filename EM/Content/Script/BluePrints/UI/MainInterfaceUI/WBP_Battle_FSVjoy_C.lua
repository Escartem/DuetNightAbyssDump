require("UnLua")
local WBP_Battle_FSVjoy_C = Class({
  "BluePrints.Common.TimerMgr"
})

function WBP_Battle_FSVjoy_C:SetPosition()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local ScreenSize = UIManager:GetDesignedScreenSize()
  local Position = UIManager:GetVirtualJoystick()
  Position.X = (Position.X - 1 + 78 / ScreenSize.X) * ScreenSize.X
  Position.Y = Position.Y * ScreenSize.Y
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bg)
  CanvasSlot:SetPosition(Position)
end

return WBP_Battle_FSVjoy_C
