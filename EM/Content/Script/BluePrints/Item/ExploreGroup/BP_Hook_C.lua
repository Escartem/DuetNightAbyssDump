require("UnLua")
local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function M:OnActorReady(Info)
  print(_G.LogTag, "LXZ OnActorReady", self:GetName())
  M.Super.OnActorReady(self, Info)
  self.Box.OnComponentBeginOverlap:Add(self, self.BoxBeginOverlap)
  self.Box.OnComponentEndOverlap:Add(self, self.BoxEndOverlap)
  self:SetActorEnableCollision(true)
  self.TargetLoc = self.FXLoc:K2_GetComponentLocation()
  self.FxLocComp = self.FXLoc
  if Info.Creator and 0 ~= Info.Creator.TriggerSphereRadius then
    self.MaxDis = Info.Creator.TriggerSphereRadius
  end
  if 0 ~= self.HookInteractiveComponent.InteractiveDistance then
    self.MinDis = self.HookInteractiveComponent.InteractiveDistance
  end
  local GameMode = URuntimeCommonFunctionLibrary.GetSubGameModeByLoc(self, self:K2_GetActorLocation())
  if nil == GameMode then
    GameMode = UGameplayStatics.GetGameMode(self)
  end
  self.HookGameModeComp = GameMode:GetComponentByClass(UHookGameModeComponent:StaticClass())
  self.HookInteractiveComponent.HookGameModeComp = self.HookGameModeComp
  self.HookInteractiveComponent:InitCommonUIConfirmID(self.Data.InteractiveId)
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
end

function M:OpenMechanism(PlayerId)
  if self.Player then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local PlayerCharacter = Battle(self):GetEntity(PlayerId)
  if GameInstance.ShouldPlayDeliveryEndMontage then
    return
  end
  local TraceInfo = "From BP_Hook_C:CheckCanInteractive"
  if not PlayerCharacter:SetCharacterTag("Hook") then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Mechanism_CannotHook"))
    return
  end
  PlayerCharacter.IsInHook = true
  PlayerCharacter:SetMechanismEid(self.Eid)
  self.Overridden.OpenMechanism(self, PlayerId)
  self.HookInteractiveComponent:OnStartInteractive(PlayerCharacter, self.HookInteractiveComponent.MontageName, self.Eid)
  self.Player = PlayerCharacter
  if self.HookGameModeComp.ValidHook then
    self.HookGameModeComp.ValidHook.HookInteractiveComponent:ForceEndInteractive(PlayerCharacter)
  end
  self.HookGameModeComp.ValidHook = self
  PlayerCharacter:ForbidSkillsInHooking(true)
  PlayerCharacter:DisableBattleWheel()
  PlayerCharacter:AddForbidTag("Battle")
  PlayerCharacter.MoveInput = FVector(0, 0, 0)
  PlayerCharacter.MoveInputCache = FVector(0, 0, 0)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  PlayerCharacter:AddMoveBlock(ESourceTags.Interactive)
  local Rot = UKismetMathLibrary.FindLookAtRotation(PlayerCharacter:K2_GetActorLocation(), self:K2_GetActorLocation())
  Rot.Pitch = 0
  Rot.Roll = 0
  PlayerCharacter:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_OverLap, false)
  PlayerCharacter:SetCollisionType("CapsuleComponent", "WorldStatic", ECollisionResponse.ECR_OverLap, false)
  PlayerCharacter:K2_SetActorRotation(Rot, false, nil, false)
end

function M:CloseMechanism(PlayerId, IsSuccess)
  self.Overridden.CloseMechanism(self, PlayerId, IsSuccess)
  local PlayerCharacter = Battle(self):GetEntity(PlayerId)
  PlayerCharacter.IsInHook = false
  PlayerCharacter:SetMechanismEid(0)
  self.HookInteractiveComponent:OnEndInteractive(PlayerCharacter, self.HookInteractiveComponent.MontageName, self.Eid)
  self.Player = nil
  if self.HookGameModeComp then
    self.HookGameModeComp.LastValidHook = self
    self.HookGameModeComp.ValidHook = nil
  end
  PlayerCharacter:ForbidSkillsInHooking(false)
  PlayerCharacter:EnableBattleWheel()
  PlayerCharacter:MinusForbidTag("Battle")
  if not PlayerCharacter:IsDead() then
    PlayerCharacter:SetCharacterTag("Falling")
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  PlayerCharacter:RemoveMoveBlock(ESourceTags.Interactive)
  PlayerCharacter:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_Block, false)
  PlayerCharacter:SetCollisionType("CapsuleComponent", "WorldStatic", ECollisionResponse.ECR_Block, false)
end

function M:ForceCloseMechanism(PlayerId, IsSuccess)
  self.Overridden.ForceCloseMechanism(self, PlayerId, IsSuccess)
  local PlayerCharacter = Battle(self):GetEntity(PlayerId)
  PlayerCharacter:ForbidSkillsInHooking(false)
  PlayerCharacter:EnableBattleWheel()
  PlayerCharacter:MinusForbidTag("Battle")
  PlayerCharacter:SetCharacterTag("Falling")
  PlayerCharacter:SetMechanismEid(0)
  self.Player = nil
  self.HookGameModeComp.LastValidHook = self
  self.HookGameModeComp.ValidHook = nil
end

function M:GetCanOpen()
  return self.Player == nil
end

function M:BoxBeginOverlap(Component, OtherActor)
  self.Player = OtherActor
end

function M:BoxEndOverlap(Component, OtherActor)
  self.Player = nil
end

function M:ShowUI()
  self.Overridden.ShowUI(self)
end

function M:CloseUI()
  self.Overridden.CloseUI(self)
end

function M:RefreshUI(Player)
end

function M:OnCharacterEnterLanding(Character, Speed)
  if not Character:IsPlayer() or Character ~= self.Player then
    return
  end
  self.HookInteractiveComponent:EndInteractive(Character)
end

function M:ReceiveEndPlay(EndReason)
  M.Super.ReceiveEndPlay(self, EndReason)
end

function M:PlayEndMontage(Character, MontageName)
  Character:PlayActionMontage("Interactive/MechInteractive", MontageName .. "_Montage", {}, false)
end

function M:DisplayInteractiveBtn(PlayerActor)
  if not self.HookGameModeComp then
    print(_G.LogTag, "Error: GameMode\231\188\186\229\176\145\233\146\169\233\148\129\231\187\132\228\187\182")
    return
  end
  self.HookGameModeComp:AddInteractiveHook(self)
  self:SetBtnDisplay(true)
end

function M:RefreshInteractiveBtn(PlayerActor)
  if not self.HookGameModeComp then
    print(_G.LogTag, "Error: GameMode\231\188\186\229\176\145\233\146\169\233\148\129\231\187\132\228\187\182")
    return
  end
  local ValidHook = self.HookGameModeComp:GetValidHook(PlayerActor, self.TargetLoc)
  if ValidHook ~= self then
    return
  end
  if not IsValid(self.InteractiveUI) then
    self.InteractiveUI = UIManager(self):GetUIObj("HookInteractive")
    if not self.InteractiveUI then
      self.InteractiveUI = UIManager(self):LoadUINew("HookInteractive")
    end
    self.InteractiveUI:Init()
  end
  if IsValid(self.InteractiveUI) and not UIManager(self):GetUIObj("HookInteractive") then
    self.InteractiveUI = UIManager(self):LoadUINew("HookInteractive")
    self.InteractiveUI:Init()
  end
  if IsValid(self.InteractiveUI) and self.InteractiveUI.Hook and self.InteractiveUI.Hook ~= ValidHook then
    self.InteractiveUI.Hook:CloseUI()
    ValidHook:ShowUI()
    self.InteractiveUI:UpdateOwner(self, self.HookInteractiveComponent, PlayerActor)
  elseif IsValid(self.InteractiveUI) and self.InteractiveUI.Hook == nil then
    ValidHook:ShowUI()
    self.InteractiveUI:UpdateOwner(self, self.HookInteractiveComponent, PlayerActor)
  end
  self:RefreshUI(PlayerActor)
end

function M:NotDisplayInteractiveBtn(PlayerActor)
  if not self.HookGameModeComp then
    print(_G.LogTag, "Error: GameMode\231\188\186\229\176\145\233\146\169\233\148\129\231\187\132\228\187\182")
    return
  end
  self:SetBtnDisplay(false)
  self.HookGameModeComp:RemoveInteractiveHook(self)
  if not IsValid(self.InteractiveUI) or self.InteractiveUI.Hook ~= self then
    return
  end
  self.InteractiveUI:Close()
  self.InteractiveUI = nil
  self:CloseUI()
end

return M
