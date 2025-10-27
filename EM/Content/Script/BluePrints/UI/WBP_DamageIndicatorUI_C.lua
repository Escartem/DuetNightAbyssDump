require("UnLua")
local WBP_DamageIndicatorUI_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_DamageIndicatorUI_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.Attacker = nil
  self.OwnerPlayer = nil
end

function WBP_DamageIndicatorUI_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Attacker, self.OwnerPlayer, self.IsShiledDamage = ...
  if self.IsShiledDamage then
    self.ImageIndicator:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.ImageIndicator_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.ImageIndicator_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.ImageIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:PlayAnimAndClose()
end

function WBP_DamageIndicatorUI_C:PlayAnimAndClose()
  self:BindToAnimationFinished(self.HitIndicatorAnim, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.HitIndicatorAnim)
  self.RootWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_DamageIndicatorUI_C:GetDamageAngleByAttacker()
  if not IsValid(self.OwnerPlayer) or not IsValid(self.Attacker) then
    return 0
  end
  return self.OwnerPlayer:GetDamageInstigatorCurrentAngle(self.Attacker)
end

function WBP_DamageIndicatorUI_C:GetOwnerPlayer()
  return self.OwnerPlayer
end

function WBP_DamageIndicatorUI_C:GetAttackerTarget()
  return self.Attacker
end

function WBP_DamageIndicatorUI_C:Close()
  self.RootWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Super.Close(self)
end

return WBP_DamageIndicatorUI_C
