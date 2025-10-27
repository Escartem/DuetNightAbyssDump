local M = Class("BluePrints.GameMode.BP_EMGameMode_C")

function M:IsNeedPostProcessMaterial()
  if not GWorld.GameInstance then
    return true
  end
  local IsLowScalabilityLevel = GWorld.GameInstance:GetGameplayScalabilityLevel() <= 1
  local IsLowMemoryDevice = true
  if IsLowScalabilityLevel and IsLowMemoryDevice then
    return false
  else
    return true
  end
end

return M
