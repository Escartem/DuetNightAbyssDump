require("UnLua")
local BP_ArmoryInteractiveComponent_C = Class()

function BP_ArmoryInteractiveComponent_C:LoadUI()
  self.Overridden.LoadUI(self)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil ~= UIManger then
    UIManger:CloseResidentUI()
  end
end

return BP_ArmoryInteractiveComponent_C
