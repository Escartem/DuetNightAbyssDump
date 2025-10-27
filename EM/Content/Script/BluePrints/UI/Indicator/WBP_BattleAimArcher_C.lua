require("UnLua")
local WBP_BattleAimArcher_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAim_C"
})

function WBP_BattleAimArcher_C:Init(Root)
  WBP_BattleAimArcher_C.Super.Init(self, Root)
  self.AimStarTable = {
    self.Archer_Dot,
    self.Archer_L,
    self.Archer_R
  }
end

function WBP_BattleAimArcher_C:TryToPlayAimDiffusionStartAnim()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_NormalAttack)
end

return WBP_BattleAimArcher_C
