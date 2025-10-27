require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.IsShowButton = false
  self.LastShowButton = false
  self.CurButtonState = "UnLock"
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.Button_Area.OnPressed:Add(self, self.OnPressed)
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:OnPressed()
  self.OwnerPlayer:FlipCameraLockOnMonster()
  if self.OwnerPlayer.CameraRotationComponent.IsCameraLookingToTarget then
    self.CurButtonState = "Lock"
    self:PlayAnimation(self.Lock)
  else
    self.CurButtonState = "Unlock"
    self:PlayAnimation(self.Unlock)
  end
end

function M:UpdateButtonInTimer()
  if IsValid(self.OwnerPlayer.CameraRotationComponent.PreLockOnInfo) or self.OwnerPlayer.IsLockOn then
    self.IsShowButton = true
  else
    self.IsShowButton = false
  end
  if self.IsShowButton ~= self.LastShowButton then
    if self.OwnerPlayer.CameraRotationComponent.IsCameraLookingToTarget then
      self:PlayAnimation(self.Lock)
      self.CurButtonState = "Lock"
    else
      self:PlayAnimation(self.Unlock)
      self.CurButtonState = "UnLock"
    end
    if self.IsShowButton then
      self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self.LastShowButton = self.IsShowButton
  if "Lock" == self.CurButtonState and not self.OwnerPlayer.CameraRotationComponent.IsCameraLookingToTarget then
    self.CurButtonState = "Unlock"
    self:PlayAnimation(self.Unlock)
  end
end

return M
