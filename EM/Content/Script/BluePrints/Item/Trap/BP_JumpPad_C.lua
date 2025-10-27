require("UnLua")
local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.FXComponent:SetComponentTickEnabled(false)
  self.JumpPadLaunchedTime = 1
end

function M:ActiveOnServer()
  self:ShowMechanism("Condition")
end

function M:DeActive()
  self:HideMechanism(false, "Condition", not self.HiddenOnDeActive)
  self.CombatClientEffectComponent:OnDeactiveEffect()
end

function M:OnPlayerEnter(Player)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    local WCSubsystem = GameMode.WorldCompositionSubSystem
    if WCSubsystem and WCSubsystem:IsAsyncTraveling() then
      return
    end
  end
  if self.StayPlayers:Contains(Player) then
    return
  end
  self.StayPlayers:Add(Player)
  self:OnPlayerStay(Player.Eid, nil, Player:GetCharacterTag())
  Player.CharFSMComp.OnAfterTagChanged:Add(self, self.OnPlayerStay)
  self.IsPlayerInside = true
end

function M:OnPlayerLeave(Player)
  self.StayPlayers:Remove(Player)
  Player.CharFSMComp.OnAfterTagChanged:Remove(self, self.OnPlayerStay)
  if 0 == self.StayPlayers:Num() then
    self.IsPlayerInside = false
  end
end

function M:OnPlayerStay(PlayerEid, OldTag, NewTag)
  local Player = Battle(self):GetEntity(PlayerEid)
  if IsValid(Player) == false then
    return
  end
  local IsTagVaild = self.CorrectTag:Contains(NewTag)
  local Player = Battle(self):GetEntity(PlayerEid)
  if true == IsTagVaild then
    self:LaunchPlayer(Player)
    Player.CharFSMComp.OnAfterTagChanged:Remove(self, self.OnPlayerStay)
  end
end

function M:LaunchPlayer(Player)
  if not self.IsCdOver then
    return
  end
  local AnimInstance = Player.Mesh:GetAnimInstance()
  if not AnimInstance then
    return
  end
  AnimInstance:OnJumpPadLaunched()
  local Velocity = self.Arrow:GetForwardVector() * self.LaunchVelocity
  Player:LaunchCharacter(Velocity, true, true)
  if math.abs(self.Arrow.RelativeRotation.Pitch - 90) > 10 then
    Player:SetIsJumpPadLaunched(true)
    local PlayerRotator = Player:K2_GetActorRotation()
    local ArrowRotator = URuntimeCommonFunctionLibrary.VectorToRotator(Velocity)
    Player:K2_SetActorRotation(FRotator(PlayerRotator.Pitch, ArrowRotator.Yaw, ArrowRotator.Roll), false, nil, false)
  end
  self:OnLaunchCharacter(Player)
  local LaunchingTime = Player.PlayerAnimInstance.IsJumpPadLaunchingTime
  Player:SetIsJumpPadLaunching(true)
  Player:AddTimer_Combat(LaunchingTime, Player.SetIsJumpPadLaunching, false, 0, nil, false, false)
  if self.IsJumppadLaunch then
    Player:AddTimer_Combat(self.JumpPadLaunchedTime, Player.SetIsJumpPadLaunched, false, 1, nil, false, false)
  else
    Player:SetIsJumpPadLaunched(false)
  end
  self:AddTimer(self.LaunchCD, self.OnCdRecover, false, 0, nil, false)
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerDungeonAchieve("PlayerUsePad", Player.Eid)
  end
end

function M:ReceiveEndPlay(EndReason)
  M.Super.ReceiveEndPlay(self, EndReason)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode:IsInRegion() then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState.CombatItemMap:Remove(self.Eid)
    GameState.ManualActiveCombat:Remove(self.ManualItemId)
    if IsValid(GameState.Battle) then
      GameState.Battle:RemoveEntity(self.Eid)
    end
  end
end

return M
