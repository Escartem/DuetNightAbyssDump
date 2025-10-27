require("UnLua")
local BP_MiniGame_Training_C = Class("BluePrints/Item/MiniGame/BP_MiniGame_C")

function BP_MiniGame_Training_C:OpenMechanism(Id)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:LoadUINew("TrainingGroundSetup")
end

return BP_MiniGame_Training_C
