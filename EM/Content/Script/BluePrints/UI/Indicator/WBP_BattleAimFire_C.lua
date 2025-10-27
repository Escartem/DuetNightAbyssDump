require("UnLua")
local WBP_BattleAimFire_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAimDiffusion_C"
})

function WBP_BattleAimFire_C:Init(Root)
  WBP_BattleAimFire_C.Super.Init(self, Root)
  self.Diffusion = {
    {
      self.Battle_Aim_Fire01
    },
    {
      self.Battle_Aim_Fire02
    },
    {
      self.Battle_Aim_Fire03
    },
    {
      self.Battle_Aim_Fire04
    }
  }
  self:UpdateFrontSightinfo()
end

function WBP_BattleAimFire_C:UpdateDiffusionVector(DiffuseDis)
  local XandY = DiffuseDis * math.cos(math.pi / 4)
  self.MaxXY = {
    {
      -XandY,
      -XandY
    },
    {
      XandY,
      -XandY
    },
    {
      -XandY,
      XandY
    },
    {XandY, XandY}
  }
end

return WBP_BattleAimFire_C
