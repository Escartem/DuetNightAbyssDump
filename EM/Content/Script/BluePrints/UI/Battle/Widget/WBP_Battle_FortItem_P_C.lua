require("UnLua")
local WBP_Battle_FortItem_P_C = Class("BluePrints.UI.Battle.Widget.WBP_Battle_FortItem_Base_C")

function WBP_Battle_FortItem_P_C:InitItem_PaoTai(SkillName, Skill, OwnerPlayer, Index, Root)
  WBP_Battle_FortItem_P_C.Super.InitItem_PaoTai(self, SkillName, Skill, OwnerPlayer, Index, Root)
  self.Text_CDPaoTai = self.Text_CD
  self.ProgressBar_CDPaoTai = self.Bar_Skill_CD
  self.OverHeating_CDPaoTai = self.OverHeating_CD
  self.Icon_SkillPaoTai = self.Icon_Skill
  self.CDFinishAnimation_PaoTai = self.Cannon_Complete
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.CDFinishAnimation_PaoTai)
  self:ListenForInputAction(self.SkillName_PaoTai, UE4.EInputEvent.IE_Pressed, false, {
    self,
    self.OnSkillActionInput_PaoTai
  })
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Skill_Complete) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Skill_Complete)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.CDFinishAnimation_PaoTai)
  self.Energy:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local SkillBaseConfig = Skill.Data
  if SkillBaseConfig.SkillBtnDesc then
    self.Text_Skill:SetText(GText(SkillBaseConfig.SkillBtnDesc))
  end
  if 2 == self.Index then
    self.OverHeating_CDPaoTai:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.OverHeating_CDPaoTai:SetRenderOpacity(1.0)
  end
end

function WBP_Battle_FortItem_P_C:OnSkillActionInput_PaoTai()
  if self.CurButtonState == "InCDTime" then
    self.Icon_Skill:SetRenderOpacity(0.2)
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Cannon_Disable) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Cannon_Disable)
    end
    if 2 == self.Index then
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "TOAST_OverHeating")
    end
  elseif self.CurButtonState == "UnLock" and not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Click) then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
  end
end

return WBP_Battle_FortItem_P_C
