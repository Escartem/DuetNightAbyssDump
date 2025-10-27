require("UnLua")
local BP_TrainingSetupInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_TrainingSetupInteractiveComponent_C:IsCanInteractive(PlayerActor)
  return self.DistanceCheck(self:GetOwner(), PlayerActor, self.InteractiveDistance)
end

function BP_TrainingSetupInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:LoadUINew("TrainingGroundSetup")
end

return BP_TrainingSetupInteractiveComponent_C
