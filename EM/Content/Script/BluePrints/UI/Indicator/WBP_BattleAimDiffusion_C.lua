require("UnLua")
local WBP_BattleAimDiffusion_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAim_C"
})

function WBP_BattleAimDiffusion_C:Init(Root)
  WBP_BattleAimDiffusion_C.Super.Init(self, Root)
end

function WBP_BattleAimDiffusion_C:UpdateDiffusionVector(DiffuseDis)
end

function WBP_BattleAimDiffusion_C:Refresh()
  self.Root.IsDiffuseState = false
  self.Root:RemoveTimer(self.Root.UpdateDiffusionStateTimer)
  self.Root.UpdateDiffusionStateTimer = nil
  self:UpadteDiffusionState("StopInit")
  self.DiffusionPassedTime = 0
  self.AimDiffusionPercent = 0
  self:SetAimDiffusion(0)
end

function WBP_BattleAimDiffusion_C:SetAimDiffusion(Percent)
  if self.MaxXY then
    for i = 1, #self.Diffusion do
      for j = 1, #self.Diffusion[i] do
        self.Diffusion[i][j]:SetRenderTranslation(FVector2D(self.MaxXY[i][1] * Percent, self.MaxXY[i][2] * Percent))
      end
    end
  end
  if self.DiffusionState == "StopInit" then
    self.Root.IsDiffuseState = false
    self.Root:RemoveTimer(self.Root.UpdateDiffusionStateTimer)
    self.Root.UpdateDiffusionStateTimer = nil
  end
end

function WBP_BattleAimDiffusion_C:UpdateFrontSightinfo()
  local BattleWeaponConfigData = DataMgr.BattleWeapon[self.Root.CurrentWeapon.WeaponId]
  if BattleWeaponConfigData.FrontSight then
    local FrontSightInfo = BattleWeaponConfigData.FrontSight
    if FrontSightInfo.DiffuseTime then
      self.FullDiffusionTime = FrontSightInfo.DiffuseTime
      self.FullDiffusionBackTime = FrontSightInfo.DiffuseBackTime
      self:UpdateDiffusionVector(FrontSightInfo.DiffuseDis)
      self.DiffusionPassedTime = 0
      self.AimDiffusionPercent = 0
      self:SetAimDiffusion(self.AimDiffusionPercent)
      self:UpadteDiffusionState("StopInit")
    end
  end
end

function WBP_BattleAimDiffusion_C:SetAimDiffusionInTick(DeltaTime)
  if self.DiffusionState == "ToMax" then
    self.DiffusionPassedTime = self.DiffusionPassedTime + DeltaTime * UE4.UGameplayStatics.GetGlobalTimeDilation(self)
    self.AimDiffusionPercent = self.DiffusionPassedTime / self.FullDiffusionTime
  elseif self.DiffusionState == "ToInit" then
    self.DiffusionPassedTime = self.DiffusionPassedTime - DeltaTime * UE4.UGameplayStatics.GetGlobalTimeDilation(self)
    self.AimDiffusionPercent = self.DiffusionPassedTime / self.FullDiffusionBackTime
  end
  if self.AimDiffusionPercent <= 0 then
    self.DiffusionPassedTime = 0
    self.AimDiffusionPercent = 0
    self:UpadteDiffusionState("StopInit")
  elseif self.AimDiffusionPercent >= 1 then
    self.DiffusionPassedTime = self.FullDiffusionTime
    self.AimDiffusionPercent = 1
    self:UpadteDiffusionState("StopMax")
  end
  self:SetAimDiffusion(self.AimDiffusionPercent)
end

function WBP_BattleAimDiffusion_C:UpdateDiffusionStateInTick(InDeltaTime)
  if (self.DiffusionState == "ToMax" or self.DiffusionState == "StopMax") and self.Root:CheckNotShootHold() then
    self.DiffusionPassedTime = self.AimDiffusionPercent * self.FullDiffusionBackTime
    self:UpadteDiffusionState("ToInit")
  end
  if self.DiffusionState == "ToMax" or self.DiffusionState == "ToInit" then
    self:SetAimDiffusionInTick(InDeltaTime)
  end
end

function WBP_BattleAimDiffusion_C:TryToPlayAimDiffusionStartAnim()
  if self.DiffusionState ~= "StopMax" then
    if self.DiffusionState ~= "ToMax" then
      self.DiffusionPassedTime = self.AimDiffusionPercent * self.FullDiffusionTime
    end
    self:UpadteDiffusionState("ToMax")
    self.Root.IsDiffuseState = true
    if not self.Root.UpdateDiffusionStateTimer then
      self.Root.UpdateDiffusionStateTimer = self.Root:AddTimer(0.033, self.Root.UpdateDiffusionStateInTick, true, 0, "UpdateDiffusionStateTimer", false, 0.033)
    end
  end
end

function WBP_BattleAimDiffusion_C:UpadteDiffusionState(NewDiffusionState)
  if self.DiffusionState ~= NewDiffusionState then
    self.DiffusionState = NewDiffusionState
    self:RefreshHitEffectEnhanceVisibility()
  end
end

function WBP_BattleAimDiffusion_C:RefreshHitEffectEnhanceVisibility()
  if self.Panel_Aim_Glow then
    if self.CurActorRelation == "Enemy" and (self.DiffusionState == "ToMax" or self.DiffusionState == "StopMax") then
      self.Panel_Aim_Glow:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    else
      self.Panel_Aim_Glow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_BattleAimDiffusion_C:SwitchIn()
  WBP_BattleAimDiffusion_C.Super.SwitchIn(self)
end

function WBP_BattleAimDiffusion_C:SwitchOut()
  WBP_BattleAimDiffusion_C.Super.SwitchOut(self)
  self.Root.IsDiffuseState = false
  self.Root:RemoveTimer(self.Root.UpdateDiffusionStateTimer)
  self.Root.UpdateDiffusionStateTimer = nil
end

return WBP_BattleAimDiffusion_C
