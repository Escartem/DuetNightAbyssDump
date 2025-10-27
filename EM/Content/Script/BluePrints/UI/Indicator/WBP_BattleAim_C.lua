require("UnLua")
local WBP_BattleAim_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_BattleAim_C:Construct()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.WaitingFlag = false
  self:AddTimer(0.2, function()
    self.WaitingFlag = true
    self:TryShowSelf()
  end, false, 0, "WaitingFlagTimer", true)
end

function WBP_BattleAim_C:Destruct()
  self:RemoveTimer("WaitingFlagTimer")
end

function WBP_BattleAim_C:Init(Root)
  self.Root = Root
  self.CurSightUI = Root.SightUI
  local AllChildren = self["Panel_Aim_" .. self.Root.CurWeaponStyleNode]:GetAllChildren()
  self.AimStarTable = AllChildren:ToTable()
end

function WBP_BattleAim_C:TryToPlayAimDiffusionStartAnim()
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Aim_Shoot) then
    local EndTime = self.Aim_Shoot:GetEndTime()
    local CurTime = self:GetAnimationCurrentTime(self.Aim_Shoot)
    if CurTime < EndTime / 2 then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Aim_Shoot)
    end
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Aim_Shoot)
  end
end

function WBP_BattleAim_C:RefreshHitEffectEnhanceVisibility()
  if self.Panel_Aim_Glow then
    if self.CurActorRelation == "Enemy" then
      self.Panel_Aim_Glow:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    else
      self.Panel_Aim_Glow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_BattleAim_C:RealRefreshAimColor(ColorIntensty)
  for _, AimNode in ipairs(self.AimStarTable) do
    AimNode:SetColorAndOpacity(ColorIntensty)
  end
end

function WBP_BattleAim_C:UpdateAimStarOpacity(Opacity)
  self:SetRenderOpacity(Opacity)
end

function WBP_BattleAim_C:SwitchIn()
  self.Root:RefreshAimColorByState(self.Root.NextActorRelation)
  if self.WaitingFlag then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_BattleAim_C:SwitchOut()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_BattleAim_C:TryShowSelf()
  if self.Root.CurPanel == self then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

return WBP_BattleAim_C
