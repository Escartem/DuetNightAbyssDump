require("UnLua")
require("Utils")
local M = Class()

function M:GetDefaultFresnel_Lua()
  local DefaultParams = Const.BuffDefaultFresnelParams
  local Ret = FFresnelParams()
  Ret.FresnelColor = FLinearColor(DefaultParams.FresnelColor[1], DefaultParams.FresnelColor[2], DefaultParams.FresnelColor[3], DefaultParams.FresnelColor[4])
  Ret.FresnelColorRange = DefaultParams.FresnelColorRange.Default
  Ret.FresnelColorStrength = DefaultParams.FresnelColorStrength.Default
  Ret.FresnelPriority = -999
  Ret.Duration = 0.5
  Ret.MaxDuration = 0.5
  Ret.bDefault = true
  return Ret
end

return M
