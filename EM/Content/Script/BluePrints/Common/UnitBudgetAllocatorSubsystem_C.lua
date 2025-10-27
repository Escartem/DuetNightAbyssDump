require("Unlua")
require("Const")
local M = Class()

function M:Initialize_Lua()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local IsTakeRecorder = GameInstance.IsTakeRecorderCapturing or GameInstance.IsTakeRecorderRendering
  if IsTakeRecorder then
    self:DisableOptParams_TR()
  else
    self:InitOptParams()
  end
end

function M:DisableOptParams_TR()
  self.bEnableBalanceTickOpt = false
  self.bEnableMeshLODBiasOpt = false
  self.bEnableNoneDynamicShadowNumOpt = false
  if PlatformName == "Android" then
    self.bEnableAnimBudget = true
  else
    self.bEnableAnimBudget = true
  end
  self.bIgnoreCompletionTimeMs = true
end

function M:InitOptParams()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.UnitBudgetTickFrameCounter = 15
  else
    self.UnitBudgetTickFrameCounter = 12
  end
  self.bEnableBalanceTickOpt = true
  self.bDynamicShadowDebug = false
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(self)
  if "Android" == PlatformName then
    self.bEnableAnimBudget = true
  else
    self.bEnableAnimBudget = true
  end
  self.bIgnoreCompletionTimeMs = true
  if "Android" == PlatformName or "IOS" == PlatformName then
    self.bEnableMeshLODBiasOpt = true
  else
    self.bEnableMeshLODBiasOpt = false
  end
  if "Android" == PlatformName or "IOS" == PlatformName then
    self.bEnableNoneDynamicShadowNumOpt = true
  else
    self.bEnableNoneDynamicShadowNumOpt = false
  end
  if "Android" == PlatformName then
    self.bUnitBudgetTickFrameLimit = false
    self.RefreshUnitBudgetTickCount = 3
  else
    self.bUnitBudgetTickFrameLimit = false
  end
  if "Android" == PlatformName then
    self.bEnableAnimCache = true
  else
    self.bEnableAnimCache = true
  end
  if "Android" == PlatformName then
    self.bEnableRegionUseUnitBudgetOptmization = true
  else
    self.bEnableRegionUseUnitBudgetOptmization = true
  end
  self.bEnableRegionUseUnitBudget_StaticCreator = true
  self.StaticCreatorUnitBudgetControlDist = 3000
  self.bEnableUnitHiddenOptimization = true
  self.bAutoCheckPlayerHighMeshLOD = true
end

function M:GetPlayerHighMeshLODIDConfig()
  return {
    1502,
    1503,
    1504,
    1801,
    2101,
    2401,
    3101,
    3102,
    4102,
    4201,
    4301,
    5101,
    5301
  }
end

return M
