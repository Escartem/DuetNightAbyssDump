require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.NiagaraTable = {
    "NiagaraSystem'/Game/UI/WBP/Common/VX/Activity/FeinaEvent/NI_Activity_FeinaEvent_Color01.NI_Activity_FeinaEvent_Color01'",
    "NiagaraSystem'/Game/UI/WBP/Common/VX/Activity/FeinaEvent/NI_Activity_FeinaEvent_Color02.NI_Activity_FeinaEvent_Color02'",
    "NiagaraSystem'/Game/UI/WBP/Common/VX/Activity/FeinaEvent/NI_Activity_FeinaEvent_Color03.NI_Activity_FeinaEvent_Color03'"
  }
end

function M:InitPaint(Index)
  local NiagaraSystem = LoadObject(self.NiagaraTable[Index])
  if IsValid(NiagaraSystem) then
    self.VX_Particle:UpdateNiagaraSystemReference(NiagaraSystem)
  end
  self.Image_Glow:SetColorAndOpacity(self["ColorA0" .. Index])
  self.Icon_Paint:SetBrushResourceObject(self["MI0" .. Index])
  self.Image_Scanlight:SetColorAndOpacity(self["ColorB0" .. Index])
end

return M
