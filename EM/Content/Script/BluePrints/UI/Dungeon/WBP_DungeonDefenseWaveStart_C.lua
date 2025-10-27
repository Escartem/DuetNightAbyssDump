require("UnLua")
local WBP_Dungeon_DefenseWaveStart_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_Dungeon_DefenseWaveStart_C:OnLoaded(...)
  self:BindToAnimationStarted(self.In, {
    self,
    self.OnInAnimationBegin
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimationEnd
  })
  WBP_Dungeon_DefenseWaveStart_C.Super.OnLoaded(self, ...)
end

function WBP_Dungeon_DefenseWaveStart_C:OnInAnimationBegin()
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI.Pos_CountDown:AddChild(self)
    BattleMainUI.Pos_CountDown:SetVisibility(UE.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Dungeon_DefenseWaveStart_C:OnOutAnimationEnd()
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    BattleMainUI.Pos_CountDown:RemoveChild(self)
  end
end

function WBP_Dungeon_DefenseWaveStart_C:PlayInAnimation(DoNotPlaySound)
  if not DoNotPlaySound then
    AudioManager(self):PlayUISound(nil, "event:/ui/common/battle_countdown_end_start", nil, nil)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
end

function WBP_Dungeon_DefenseWaveStart_C:PlayOutAnimation()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
end

return WBP_Dungeon_DefenseWaveStart_C
