require("Unlua")
require("Const")
local M = Class()

function M:Initialize_Lua()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local IsTakeRecorder = GameInstance.IsTakeRecorderCapturing or GameInstance.IsTakeRecorderRendering
  if true == IsTakeRecorder then
    self.bEnableFXScalabilityOpt = false
    self.bEnableFXPool = false
  else
    self.bEnableFXScalabilityOpt = true
    self.bEnableFXMaxNumOpt = true
    self.bEnableClientOpt = true
    self.bOnlyDungeon = true
    self.EnableRenderThreadBundget = true
    self.EMFXBudget_HistorySize = 60
    self.EMFXBudget_GameThread = 1
    self.EMFXBudget_GameThreadConcurrent = 1
    self.EMFXBudget_RenderThread = 1
    self.EMFXBudget_AdjustedUsageDecayRate = -1
    self.BindRemainingTime = 0.2
    self.bEnableDetailDebug = true
    self.bEnableFXPool = true
    self.EnableDefaultNiagaraInstance = true
  end
end

return M
