require("UnLua")
local BP_EMPlayerState_C = Class()
local PlayerRecoveryState = {
  Alive = 0,
  Dead = 1,
  WaitingRecover = 2
}

function BP_EMPlayerState_C:Initialize(Initializer)
  local FBattleInfoArray = UE.FBattleInfoArray
  self.ReconnectTimeout = DataMgr.GlobalConstant.ReconnectTimeout.ConstantValue
  self.TotalReconnectTimeout = DataMgr.GlobalConstant.TotalReconnectTimeout.ConstantValue
end

function BP_EMPlayerState_C:ReceiveEndPlay(EndReason)
  DebugPrint("gmy@BP_EMPlayerState_C:ReceiveEndPlay ", IsClient(self), self.PlayerName)
  self.OnRepbIsEMInactiveDelegate:Clear()
  self.OnReceiveActorStateChangeDelegate:Clear()
  self:DungeonOtherPlayerChange(false)
end

function BP_EMPlayerState_C:DungeonOtherPlayerChange(bIsIn)
  local bIsTeammate = TeamController:GetModel():IsTeammateByAvatarEid(self.AvatarEidStr)
  if IsClient(self) and not bIsTeammate then
    local UIObj = UIManager(self):GetUIObj("TeamToast")
    if UIObj then
      UIManager(self):UnLoadUINew("TeamToast")
    end
    UIManager(self):LoadUINew("TeamToast", self, bIsIn)
  end
  if not bIsIn then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local SceneMgrComponent = GameInstance:GetSceneManager()
    if IsValid(SceneMgrComponent) then
      SceneMgrComponent:UpdateSceneOtherPlayerGuide(self.Eid, "Exit")
    end
  end
end

function BP_EMPlayerState_C:RegisterOldBattleInfo(BattleInfo, PlayerInfo)
  self:ClearOldBattleInfo()
  self:SetOldBattleInfo("Player", 0, 0, PlayerInfo.Level, PlayerInfo.Exp)
  local RoleInfo = BattleInfo.RoleInfo
  self:SetOldBattleInfo("Char", RoleInfo.RoleId, RoleInfo.EnhanceLevel, RoleInfo.Level, RoleInfo.Exp)
  local MeleeWeapon = BattleInfo.MeleeWeapon
  self:SetOldBattleInfo("MeleeWeapon", MeleeWeapon.WeaponId, MeleeWeapon.EnhanceLevel, MeleeWeapon.Level, MeleeWeapon.Exp)
  local RangedWeapon = BattleInfo.RangedWeapon
  self:SetOldBattleInfo("RangedWeapon", RangedWeapon.WeaponId, RangedWeapon.EnhanceLevel, RangedWeapon.Level, RangedWeapon.Exp)
end

function BP_EMPlayerState_C:OnRep_PlayerGuideEids()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) then
    SceneMgrComponent:UpdateAllPlayerGuideIcon()
  end
end

function BP_EMPlayerState_C:OnRep_Eid()
  EventManager:FireEvent(EventID.OnRepEidPlayerState, self.Eid)
end

function BP_EMPlayerState_C:OnRep_EMPlayerName()
  EventManager:FireEvent(EventID.OnRepPlayerName)
end

function BP_EMPlayerState_C:OnRep_TeamRecoveryState(PrevRecoveryState)
  DebugPrint("PlayerState OnRep_TeamRecoveryState:", self.TeamRecoveryState, "Eid:", self.Eid, "PrevState:", PrevRecoveryState)
  EventManager:FireEvent(EventID.OnTeamRecoveryStateChange, self.Eid, self.TeamRecoveryState, PrevRecoveryState)
end

function BP_EMPlayerState_C:IsInSettlementScene()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not GameInstance then
    return true
  end
  return GameInstance.IsInSettlementScene
end

function BP_EMPlayerState_C:OnRep_RecoverySpeed(PrevSpeed)
  DebugPrint("PlayerState OnRep_RecoverySpeed:", self.RecoverySpeed, "Eid:", self.Eid)
  if self.RecoverySpeed > 0 then
    EventManager:FireEvent(EventID.OnTeamRecoverySpeedChanged, self.Eid, self.RecoverySpeed, PrevSpeed)
  end
end

function BP_EMPlayerState_C:OnRep_DyingDuration()
end

return BP_EMPlayerState_C
