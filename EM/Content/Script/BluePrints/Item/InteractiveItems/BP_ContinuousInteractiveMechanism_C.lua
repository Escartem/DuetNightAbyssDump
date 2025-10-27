require("UnLua")
local M = Class({
  "BluePrints.Item.Chest.BP_MechanismBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.MaxTime = self.UnitParams.MaxTime
  self.ReduceTime = self.UnitParams.ReduceTime
  self.CurPercent = 0
  self.PrePercent = 0
  self.IsInInteractive = false
  self.InteractiveType = Const.PressInteractive
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if self.IsInInteractive then
    self.CurPercent = self.CurPercent + DeltaSeconds / self.MaxTime
    if self.CurPercent >= 1 then
      self:OnMechanismComplete(self.NowPlayerEid)
      self:SetActorTickEnabled(false)
      return
    end
    local CurQuarter = math.floor(self.CurPercent / 0.25)
    if CurQuarter ~= math.floor(self.PrePercent / 0.25) and self.CurPercent > self.PrePercent then
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      if GameMode and GameMode.OnMechanismInteractiveProgress then
        GameMode:OnMechanismInteractiveProgress(self, CurQuarter)
      end
    end
  elseif self.ReduceTime > 0 then
    self.CurPercent = math.max(0.0, self.CurPercent - DeltaSeconds / self.ReduceTime)
    if self.CurPercent <= 0 then
      self:SetActorTickEnabled(false)
    end
  end
  self.PrePercent = self.CurPercent
end

function M:OpenMechanism(Eid)
  local Player = Battle(self):GetEntity(Eid)
  if Player then
    self.ChestInteractiveComponent:OnStartInteractive(Player, self.ChestInteractiveComponent.MontageName, self.Eid)
    self:SetActorTickEnabled(true)
    self.IsInInteractive = true
    self.NowPlayerEid = Eid
  end
end

function M:CloseMechanism(Eid, IsSuccess)
  local Player = Battle(self):GetEntity(Eid)
  if Player then
    Player.OnInteractiveDelegate:Add(self, self.ChangeToNormalState)
    self.ChestInteractiveComponent:OnEndInteractive(Player, self.ChestInteractiveComponent.MontageName, self.Eid)
    if self.ReduceTime <= 0 then
      self:SetActorTickEnabled(false)
    end
    self.IsInInteractive = false
  end
end

function M:OnMechanismComplete(Eid)
  local Player = Battle(self):GetEntity(Eid)
  if Player then
    self.ChestInteractiveComponent.bCanUsed = false
    self.CanOpen = false
    self.ChestInteractiveComponent:OnEndInteractive(Player, self.ChestInteractiveComponent.MontageName, self.Eid)
    self:ChangeState("InteractDone", Eid)
  end
end

function M:ChangeToNormalState(Player)
  Player.OnInteractiveDelegate:Remove(self, self.ChangeToNormalState)
  self:ChangeState("InteractBreak", Player.Eid)
end

function M:CameraToPlayer(BlendTime)
  if not self.CameraOnSelf then
    return
  end
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player then
    return
  end
  local PlayerRot = Player:K2_GetActorRotation().Yaw
  Controller:SetControlRotation(FRotator(0, PlayerRot, 0))
  Controller:SetViewTargetWithBlend(Player, BlendTime)
  self.CameraOnSelf = false
end

function M:CameraToMechanism(CameraComp, BlendTime)
  if self.CameraOnSelf then
    return
  end
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player or not CameraComp then
    return
  end
  CameraComp:SetAspectRatio(Player.CharCameraComponent.AspectRatio)
  CameraComp:SetFieldOfView(Player.CharCameraComponent.FieldOfView)
  Controller:SetViewTargetWithBlend(self, BlendTime)
  self.CacheControllerPausedParam = Controller.bShouldPerformFullTickWhenPaused
  Controller.bShouldPerformFullTickWhenPaused = true
  Player.CharSpringArmComponent:SetTickableWhenPaused(true)
  self.CameraOnSelf = true
end

return M
