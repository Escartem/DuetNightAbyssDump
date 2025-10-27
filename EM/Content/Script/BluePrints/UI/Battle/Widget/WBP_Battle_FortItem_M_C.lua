require("UnLua")
local WBP_Battle_FortItem_M_C = Class("BluePrints.UI.BP_UIState_C")
WBP_Battle_FortItem_M_C._components = {
  "BluePrints.UI.Battle.Widget.WBP_Battle_FortItem_Base_C"
}

function WBP_Battle_FortItem_M_C:Construct()
  self.Button_Fire.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Fire.OnReleased:Add(self, self.OnBtnReleased)
end

function WBP_Battle_FortItem_M_C:OnBtnPressed()
  self.Root:TryToPlayTargetCommand(self.SkillName_PaoTai, false)
  if self.CurButtonState == "InCDTime" then
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Disable) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Disable)
    end
    if 2 == self.Index then
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "TOAST_OverHeating")
    end
  else
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Click) then
      EMUIAnimationSubsystem:EMStopAnimation(self, self.Click)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
  end
end

function WBP_Battle_FortItem_M_C:OnBtnReleased()
  self.Root:TryToStopTargetCommand(self.SkillName_PaoTai, true)
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Press) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Press)
  end
  if self.CurButtonState == "InCDTime" then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
  end
end

function WBP_Battle_FortItem_M_C:InitItem_PaoTai(SkillName, Skill, OwnerPlayer, Index, Root)
  self.Text_CDPaoTai = self.Text_CD
  self.ProgressBar_CDPaoTai = self.ProgressBar_CD
  self.OverHeating_CDPaoTai = self.ProgressBar_CD_Overload
  self.Icon_SkillPaoTai = self.Icon_Skill
  self.CDFinishAnimation_PaoTai = self.Click
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.CDFinishAnimation_PaoTai)
  if 1 == Index then
    self.OverHeating_CDPaoTai:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.OverHeating_CDPaoTai:SetRenderOpacity(0)
    self.ProgressBar_CDPaoTai:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.ProgressBar_CDPaoTai:SetRenderOpacity(1.0)
  elseif 2 == Index then
    self.OverHeating_CDPaoTai:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.OverHeating_CDPaoTai:SetRenderOpacity(1.0)
    self.ProgressBar_CDPaoTai:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.ProgressBar_CDPaoTai:SetRenderOpacity(0)
  end
end

AssembleComponents(WBP_Battle_FortItem_M_C)
return WBP_Battle_FortItem_M_C
