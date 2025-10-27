require("UnLua")
local M = Class()

function M:Construct()
  self.MonsterIcon2EndIcon:Add("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Enemy.T_Gp_Enemy", "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Enemy_Sleep.T_Gp_Enemy_Sleep")
  self.MonsterIcon2EndIcon:Add("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_Elite.T_Gp_Rescue_Elite", "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_Elite_Sleep.T_Gp_Rescue_Elite_Sleep")
end

return M
