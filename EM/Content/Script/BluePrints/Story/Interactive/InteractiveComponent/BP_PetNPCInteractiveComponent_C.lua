local BP_PetNPCInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_PetNPCInteractiveComponent_C:IsCanInteractive(PlayerActor)
  return self.Owner and self.Owner:CheckCanInteractive() and self.DistanceCheck(self.Owner, PlayerActor, self.InteractiveDistance) and not self.Owner.bHidden
end

function BP_PetNPCInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  UIManager:LoadUINew("PetCapture", self.Owner)
  self.Owner:SetInteractiveState(ENpcPetState.None)
  self.Owner:OnPetMiniGameSwitch(1)
  local NewSourceLocation = self.Owner:K2_GetActorLocation()
  local PlayerLocation = PlayerActor:K2_GetActorLocation()
  PlayerLocation.Z = NewSourceLocation.Z
  local Rotate = UE4.UKismetMathLibrary.FindLookAtRotation(NewSourceLocation, PlayerLocation)
  self.Owner:K2_SetActorRotation(Rotate, false)
  local Rotator, IsSuccess = self.Owner.PetNpcCollisionCheck:StartCheckCollision()
  if IsSuccess then
    self.Owner:K2_SetActorRotation(Rotator, false)
  end
  DebugPrint("\229\174\160\231\137\169\228\186\164\228\186\146\230\136\144\229\138\159")
end

function BP_PetNPCInteractiveComponent_C:ResetPetState()
  if self.Owner.InteractiveState == ENpcPetState.None then
    self.Owner:SetInteractiveState(ENpcPetState.Active)
  end
end

function BP_PetNPCInteractiveComponent_C:CapturePetCallBack(ErrCode, Probability, UniqueId)
  if ErrCode == ErrorCode.RET_PET_FOOD_RESOURCE_NOT_ENOUGH then
    ErrorCode:Check(ErrCode)
  elseif ErrCode == ErrorCode.RET_PET_CAPTURE_FAILED then
    self.Owner:SetInteractiveState(ENpcPetState.InteractiveFail)
    self:CapturePet(false, Probability, UniqueId)
  elseif ErrCode == ErrorCode.RET_SUCCESS then
    self.Owner:SetInteractiveState(ENpcPetState.InteractiveSuccess)
    self:CapturePet(true, Probability, UniqueId)
  else
    ErrorCode:Check(ErrCode)
  end
end

function BP_PetNPCInteractiveComponent_C:CapturePet(CaptureRes, Probability, UniqueId)
  local ProgressWidget = self.Owner.PetHeadWidgetComponent:GetWidget()
  if not ProgressWidget then
    UE4.UResourceLibrary.LoadClassAsync(self, "/Game/UI/WBP/Pet_Capture/Widget/WBP_Pet_Capture_Progress", {
      self,
      function(_, WidgetClass)
        ProgressWidget = UIManager(self):CreateWidget(WidgetClass, false)
        self.Owner.PetHeadWidgetComponent:SetWidget(ProgressWidget)
        ProgressWidget:StartProgressAnimation(self.Owner, Probability, CaptureRes, UniqueId)
      end
    })
  else
    ProgressWidget:StartProgressAnimation(self.Owner, Probability, CaptureRes, UniqueId)
  end
end

return BP_PetNPCInteractiveComponent_C
