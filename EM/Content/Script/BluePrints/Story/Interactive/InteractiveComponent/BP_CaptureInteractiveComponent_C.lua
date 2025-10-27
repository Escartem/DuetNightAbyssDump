require("UnLua")
local BP_CaptureInteractiveComponent_C = Class({
  "BluePrints.Item.Chest.BP_ChestInteractiveComponent_C",
  "BluePrints.Common.TimerMgr"
})

function BP_CaptureInteractiveComponent_C:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.Capturing = false
  self.InteractStartTimer = 0
  self.Priority = "Battle"
end

function BP_CaptureInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local Owner = self:GetOwner()
  local CanOpen = Owner:GetCanCapture(PlayerActor.Eid)
  if self:DistanceCheckComponent(PlayerActor, self.InteractiveDistance, false) and self.CFaceToACheckComponent(self, PlayerActor, self.InteractiveFaceAngle) and self.AFaceToCCheckComponent(PlayerActor, self, self.InteractiveAngle) and self:CheckPlayerTag(PlayerActor) and CanOpen and not Owner.OpenState then
    return true
  end
  return false
end

function BP_CaptureInteractiveComponent_C:DisplayInteractiveBtn(PlayerActor)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:LoadUINew(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:AddInteractiveItem(self)
  self:SetBtnDisplayed(PlayerActor, true)
end

function BP_CaptureInteractiveComponent_C:RefreshInteractiveBtn(PlayerActor)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local LoadedUI = UIManager:GetUI(UIConst.InteractiveUIName)
  if not LoadedUI then
    return
  end
  if not self.Capturing then
    return
  end
  LoadedUI:TryDoCapture(self.InteractiveTime)
end

function BP_CaptureInteractiveComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  self:SetBtnDisplayed(PlayerActor, false)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:GetUIObj(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:RemoveInteractiveItem(self)
  self.Capturing = false
  if PlayerActor and PlayerActor.MechanismEid == self:GetOwner().Eid and not self:IsCanInteractive(PlayerActor) then
    self:EndPressInteractive(PlayerActor, false)
  end
end

function BP_CaptureInteractiveComponent_C:StartInteractive(PlayerActor)
  self.CanEnd = true
  if self:IsCanInteractive(PlayerActor) and not PlayerActor.WaitCallBack then
    local Owner = self:GetOwner()
    PlayerActor:InteractiveMechanism(Owner.Eid, PlayerActor.Eid, 0, self.CommonUIConfirmID, true)
    if self.InteractiveTime > 0 and self.Handle == nil then
      if self.InterruptPlayer then
        self.Handle = self:AddTimer(self.InteractiveTime, self.EndPressInteractive, false, 0, nil, nil, PlayerActor, true)
      else
        self.Handle = self:AddTimer(self.InteractiveTime, self.StartInteractive, true, self.InteractiveTime, nil, nil, PlayerActor)
      end
    end
    self.Capturing = true
    self.bPressed = true
    if not AudioManager(self):IsSoundPlaying(nil, "CaptureSound") then
      AudioManager(self):PlayUISound(nil, "event:/ui/common/catch_hud_process", "CaptureSound", nil)
    end
    local Owner = self:GetOwner()
    if not AudioManager(self):IsSoundPlaying(nil, "MonCaptureSound") then
      ScreenPrint("PlayingMonCap")
      AudioManager(self):PlayNormalSound(Owner, nil, "event:/ui/common/catch_enemy_process", "MonCaptureSound", false)
    end
  end
  self.InteractStartTimer = UE4.UGameplayStatics.GetTimeSeconds(self)
end

function BP_CaptureInteractiveComponent_C:EndPressInteractive(PlayerActor, IsSuccess, ReasonId)
  self.Capturing = false
  self.Super.EndPressInteractive(self, PlayerActor, IsSuccess, ReasonId)
  if IsSuccess then
    AudioManager(self):PlayUISound(nil, "event:/ui/common/catch_sucess", nil, nil)
  end
  AudioManager(self):StopSound(nil, "CaptureSound")
  AudioManager(self):StopSound(self:GetOwner(), "MonCaptureSound")
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  if not UIManager then
    return
  end
  local LoadedUI = UIManager:GetUI(UIConst.InteractiveUIName)
  if not LoadedUI then
    return
  end
  if IsSuccess then
    LoadedUI:OnCaptureSuccess()
  else
    LoadedUI:StopCapture()
  end
end

function BP_CaptureInteractiveComponent_C:GetOwnerCenter(Owner)
  local OwnerLoc = Owner:K2_GetActorLocation()
  if Owner.Box then
    local V = FVector(0, 0, Owner.Box:GetScaledBoxExtent().Z)
    local Offset = UE4.UKismetMathLibrary.GreaterGreater_VectorRotator(V, Owner:K2_GetActorRotation())
    OwnerLoc = OwnerLoc + Offset
  end
  return OwnerLoc
end

return BP_CaptureInteractiveComponent_C
