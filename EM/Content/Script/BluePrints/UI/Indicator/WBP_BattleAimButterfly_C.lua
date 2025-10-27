require("UnLua")
local WBP_BattleAimButterfly_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAimDiffusion_C"
})

function WBP_BattleAimButterfly_C:Init(Root)
  WBP_BattleAimButterfly_C.Super.Init(self, Root)
  self.Diffusion = {
    {
      self.VX_Aim__Butterfly_showderL,
      self.VX_BlendBG_L,
      self.VX_Aim__Butterfly_L,
      self.VX_Aim__Butterfly_Glow_L
    },
    {
      self.VX_Aim__Butterfly_showderR,
      self.VX_BlendBG_R,
      self.VX_Aim__Butterfly_R,
      self.VX_Aim__Butterfly_Glow_R
    }
  }
  self:UpdateFrontSightinfo()
end

function WBP_BattleAimButterfly_C:UpdateDiffusionVector(DiffuseDis)
  self.MaxXY = {
    {DiffuseDis, 0},
    {
      -DiffuseDis,
      0
    }
  }
end

function WBP_BattleAimButterfly_C:SwitchIn()
  WBP_BattleAimButterfly_C.Super.SwitchIn(self)
  self:ChangeColorByModelId()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Aim_In)
end

function WBP_BattleAimButterfly_C:SwitchOut()
  WBP_BattleAimButterfly_C.Super.SwitchOut(self)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Aim_Out)
end

function WBP_BattleAimButterfly_C:ChangeColorByModelId()
  if self.Root.OwnerPlayer.ModelId ~= self.CurModelId then
    self.CurModelId = self.Root.OwnerPlayer.ModelId
    local AnimName = self.ModelId2AnimName:Find(self.CurModelId)
    if AnimName then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self[AnimName])
    end
  end
end

return WBP_BattleAimButterfly_C
