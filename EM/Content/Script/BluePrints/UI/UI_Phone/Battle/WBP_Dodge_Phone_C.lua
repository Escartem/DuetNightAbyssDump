require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Button_Area.OnPressed:Add(self, self.OnPressed)
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.MaxAvoidTimes = self.OwnerPlayer:GetAttr("MaxAvoidExecuteTimes")
  self.DodgeCD = self.OwnerPlayer:GetAttr("AvoidChargeCd") or 0
  local DodgeCount = self.OwnerPlayer.DodgeCount
  local AvoidRemainTimes = math.max(0, self.MaxAvoidTimes - DodgeCount)
  self.AvoidRemainTimes = AvoidRemainTimes
  self.CDMat = self.ProgressBar_CD:GetDynamicMaterial()
  self.Text_Times:SetText(self.AvoidRemainTimes)
  self.IsForbidden = false
  if self.OwnerPlayer:CheckSkillInActive(UE4.ESkillName.Avoid) then
    self.CurButtonState = "InActive"
  else
    self.CurButtonState = "Active"
  end
end

function M:OnPressed()
  self:OnPressed_Presentation()
  self.OwnerPanel:TryToPlayTargetCommand("Avoid", true)
end

function M:OnPressed_Presentation()
  if self.CurButtonState == "InActive" then
    return
  end
  if self.AvoidRemainTimes > 0 then
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Click) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
    end
  elseif not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Disable) then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Disable)
  end
end

function M:UpdateButtonInTimer()
  if self.CurButtonState == "InActive" then
    return
  end
  self.MaxAvoidTimes = self.OwnerPlayer:GetAttr("MaxAvoidExecuteTimes")
  self.DodgeCD = self.OwnerPlayer:GetAttr("AvoidChargeCd") or 0
  local DodgeCount = self.OwnerPlayer.DodgeCount
  local AvoidRemainTimes = self.MaxAvoidTimes - DodgeCount
  local Now = UE4.UGameplayStatics.GetTimeSeconds(self)
  if AvoidRemainTimes ~= self.MaxAvoidTimes then
    self.DodgeChargeTimeRemain = self.OwnerPlayer:GetDodgeChargeRemainTime()
    local Percent = self.DodgeChargeTimeRemain / self.DodgeCD
    self.CDMat:SetScalarParameterValue("Percent", 1 - Percent)
  else
    self.DodgeChargeTimeRemain = 0
    self.CDMat:SetScalarParameterValue("Percent", 0)
  end
  if self.AvoidRemainTimes ~= AvoidRemainTimes then
    print(_G.LogTag, "DodgeCount changed, AvoidRemainTimes:", AvoidRemainTimes, Now)
    self.Text_Times:SetText(AvoidRemainTimes)
  end
  self.AvoidRemainTimes = AvoidRemainTimes
  if 0 == self.AvoidRemainTimes and self.IsForbidden == false then
    self.IsForbidden = true
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Forbidden) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Forbidden)
    end
  elseif self.AvoidRemainTimes > 0 and self.IsForbidden == true then
    self.IsForbidden = false
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Normal) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
    end
  end
end

return M
