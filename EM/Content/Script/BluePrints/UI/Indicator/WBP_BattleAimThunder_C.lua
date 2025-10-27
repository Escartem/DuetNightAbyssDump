require("UnLua")
local WBP_BattleAimThunder_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAimDiffusion_C"
})

function WBP_BattleAimThunder_C:Init(Root)
  WBP_BattleAimThunder_C.Super.Init(self, Root)
  self.Diffusion = {
    {
      self.Battle_Aim_Thunder01
    },
    {
      self.Battle_Aim_Thunder02
    }
  }
  self:UpdateFrontSightinfo()
end

function WBP_BattleAimThunder_C:UpdateDiffusionVector(DiffuseDis)
  self.MaxXY = {
    {0, DiffuseDis},
    {
      0,
      -DiffuseDis
    }
  }
end

return WBP_BattleAimThunder_C
