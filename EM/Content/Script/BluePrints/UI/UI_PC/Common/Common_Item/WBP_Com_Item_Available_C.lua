require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local StyleMap = {
  Gold = 5,
  White = 1,
  Purple = 4,
  Blue = 3
}

function M:SetStyle(StyleStr)
  StyleStr = StyleStr or "Gold"
  local StyleCode = StyleMap[StyleStr]
  local DynMat = self.VX_Glow:GetDynamicMaterial()
  DynMat:SetVectorParameterValue("MainColor", self["VX_Glow_" .. StyleCode].SpecifiedColor)
  DynMat = self.VX_Rolllight:GetDynamicMaterial()
  DynMat:SetVectorParameterValue("MainColor", self["VX_Rolllight_" .. StyleCode].SpecifiedColor)
  DynMat = self.VX_Scanlight:GetDynamicMaterial()
  DynMat:SetVectorParameterValue("MainColor", self["VX_Scanlight_" .. StyleCode].SpecifiedColor)
end

return M
