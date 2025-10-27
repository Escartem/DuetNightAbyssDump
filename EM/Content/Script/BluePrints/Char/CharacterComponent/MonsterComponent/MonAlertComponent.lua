require("UnLua")
require("Const")
local Component = Class()

function Component:InitComponent_Lua()
  rawset(self, "AlertData", DataMgr.AlertData[self.AlertId])
end

function Component:RegionRequestCommonAlertSuccess()
  local Owner = self.Owner
  if not IsValid(Owner) then
    return
  end
  if self.IsInCommonAlert then
    return
  end
  if not self.AlertGameMode:IsCommonAlertingMonster(Owner) then
    return
  end
  local ClanMgr = self.AlertGameMode:GetClan(Owner.ClanId)
  ClanMgr.InCommonAlert = true
  self.AlertGameMode:TryResetCommonAlertingInfo(Owner)
  self:AlertStateChange(Const.FightState, true)
  self:UpdateAlertInfo()
  self:BroadCastInfo()
  Owner:GetOwnBlackBoardComponent():SetValueAsObject("AlarmTarget", nil)
  Owner:GetOwnBlackBoardComponent():SetValueAsBool("AlarmTrigger", false)
  ClanMgr:CreateMonsterSpawn()
  self.AlertGameMode:OnEnterCommonAlert()
end

function Component:RequestRescueAlertSuccess()
  local Owner = self.Owner
  if not IsValid(Owner) then
    return
  end
  if not self.AlertGameMode:IsRescueAlertingMonster(Owner) then
    return
  end
  DebugPrint("\230\149\145\230\143\180\229\137\175\230\156\172\230\138\165\232\173\166\230\136\144\229\138\159  \230\138\165\232\173\166\230\128\170 Eid:" .. Owner.Eid .. "  UnitId:" .. Owner.UnitId)
  self:BroadCastRescueAlertInfo()
  self:AlertStateChange(Const.FightState, true)
  self:UpdateAlertInfo()
  self:BroadCastInfo()
  self.AlertGameMode:TriggerDungeonComponentFun("TryResetRescueAlertingInfo", self.Owner)
  Owner:GetOwnBlackBoardComponent():SetValueAsObject("AlarmTarget", nil)
  Owner:GetOwnBlackBoardComponent():SetValueAsBool("AlarmTrigger", false)
  self.AlertGameMode:GetDungeonComponent().RescueIsInCommonAlert = true
end

function Component:ClanRequestAlertSuccess()
  local Owner = self.Owner
  if not IsValid(Owner) then
    return
  end
  if self.IsInCommonAlert then
    return
  end
  if not self.AlertGameMode:IsCommonAlertingMonster(Owner) then
    return
  end
  local ClanMgr = self.AlertGameMode:GetClan(Owner.ClanId)
  ClanMgr.InCommonAlert = true
  self:BroadCastClanInfo(ClanMgr.MonsterMap)
end

function Component:TrySetRescueAlertingInfo(LastTargetAlertedNum)
  if self.AlertGameMode:IsInRegion() then
    return false
  end
  if self:GetAlertValue_Lua() < 200 then
    return false
  end
  if self.AlertGameMode.EMGameState.GameModeType == "Rescue" then
    return self.AlertGameMode:TriggerDungeonComponentFun("TrySetRescueAlertingInfo", LastTargetAlertedNum, self.Owner)
  end
  return false
end

function Component:TryResetRescueAlertingInfo()
  self.AlertGameMode:TriggerDungeonComponentFun("TryResetRescueAlertingInfo", self.Owner)
end

function Component:RequestCommonAlertingEid()
  return self.AlertGameMode:RequestCommonAlertingEid(self.Owner)
end

function Component:TrySetBBAlertingInfo()
  local Owner = self.Owner
  if not IsValid(Owner) then
    return
  end
  if self.AlertData.AlarmMode == "UseAlarmMechanism" then
    local AlertMechanism = self.AlertGameMode:GetAlertMechanismInfo(Owner)
    if not AlertMechanism then
      self.AlertGameMode:TryResetCommonAlertingInfo(Owner)
      self.OnlyBaseAlertEnable = true
      DebugPrint("Monster Alert \230\128\170\231\137\169\230\138\162\229\141\160\228\186\134\230\138\165\232\173\166\228\189\141\228\189\134\230\152\175\230\178\161\230\156\137\230\156\186\229\133\179\230\138\165\232\173\166\229\164\177\232\180\165---Eid" .. Owner.Eid .. " UnitId:" .. Owner.UnitId .. " Loc:" .. tostring(Owner:K2_GetActorLocation()))
      return false
    end
    DebugPrint("Monster Alert \230\138\162\229\141\160\230\138\165\232\173\166\228\189\141\239\188\140\232\142\183\229\143\150\230\138\165\232\173\166\230\156\186\229\133\179\230\136\144\229\138\159---Eid:" .. Owner.Eid .. " UnitId:" .. Owner.UnitId .. " Loc:" .. tostring(AlertMechanism:GetMonsterAnimTrans().Translation))
    Owner:GetOwnBlackBoardComponent():SetValueAsVector("AlarmMechanismInteractiveLoc", AlertMechanism:GetMonsterAnimTrans().Translation)
    Owner:GetOwnBlackBoardComponent():SetValueAsObject("AlarmMechanism", AlertMechanism)
  end
  Owner:BBSetAlarmTarget(self.AlertGameMode:RequestCommonAlarmTargetInfo(Owner))
  Owner:GetOwnBlackBoardComponent():SetValueAsBool("AlarmTrigger", true)
  DebugPrint("Monster Alert \230\138\162\229\141\160\230\138\165\232\173\166\228\189\141\230\136\144\229\138\159\239\188\140\229\188\128\229\167\139\230\138\165\232\173\166\229\138\168\231\148\187---Eid:" .. Owner.Eid .. " UnitId:" .. Owner.UnitId .. " Loc:" .. tostring(Owner:K2_GetActorLocation()) .. " AlarmTargetLoc:" .. tostring(self.AlarmTarget:K2_GetActorLocation()))
  return true
end

function Component:TrySetClanAlertingInfo()
  local Owner = self.Owner
  if not IsValid(Owner) then
    return
  end
  if self.AlertData.AlarmMode == "UseAlarmMechanism" then
    local AlertMechanism = self.AlertGameMode:GetAlertMechanismInfo(Owner)
    if not AlertMechanism then
      self.AlertGameMode:TryResetCommonAlertingInfo(Owner)
      self.OnlyBaseAlertEnable = true
      DebugPrint("Clan Monster Alert \230\128\170\231\137\169\230\138\162\229\141\160\228\186\134\230\138\165\232\173\166\228\189\141\228\189\134\230\152\175\230\178\161\230\156\137\230\156\186\229\133\179\230\138\165\232\173\166\229\164\177\232\180\165---Eid" .. Owner.Eid .. " UnitId:" .. Owner.UnitId .. " Loc:" .. tostring(Owner:K2_GetActorLocation()))
      return false
    end
    DebugPrint("Clan Monster Alert \230\138\162\229\141\160\230\138\165\232\173\166\228\189\141\239\188\140\232\142\183\229\143\150\230\138\165\232\173\166\230\156\186\229\133\179\230\136\144\229\138\159---Eid:" .. Owner.Eid .. " UnitId:" .. Owner.UnitId .. " Loc:" .. tostring(AlertMechanism:GetMonsterAnimTrans().Translation))
    Owner:GetOwnBlackBoardComponent():SetValueAsVector("AlarmMechanismInteractiveLoc", AlertMechanism:GetMonsterAnimTrans().Translation)
    Owner:GetOwnBlackBoardComponent():SetValueAsObject("AlarmMechanism", AlertMechanism)
  end
  Owner:BBSetAlarmTarget(self.AlertGameMode:RequestCommonAlarmTargetInfo(Owner))
  Owner:GetOwnBlackBoardComponent():SetValueAsBool("AlarmTrigger", true)
  DebugPrint("Clan Monster Alert \230\138\162\229\141\160\230\138\165\232\173\166\228\189\141\230\136\144\229\138\159\239\188\140\229\188\128\229\167\139\230\138\165\232\173\166\229\138\168\231\148\187---Eid:" .. Owner.Eid .. " UnitId:" .. Owner.UnitId .. " Loc:" .. tostring(Owner:K2_GetActorLocation()) .. " AlarmTargetLoc:" .. tostring(self.AlarmTarget:K2_GetActorLocation()))
  local ClanMgr = self.AlertGameMode:GetClan(Owner.ClanId)
  if not ClanMgr then
    DebugPrint("Clan Monster Alert ClanMgr is nil, can't set clan alerting info---Eid" .. Owner.Eid .. " UnitId:" .. Owner.UnitId)
    return
  end
  ClanMgr:ActiveClanAlert()
  self:ClanRequestAlertSuccess()
  return true
end

function Component:GetAlertValue_Lua()
  return self.Owner.MonAlertComponent.AlertValue
end

function Component:ResetHearInfoCD()
  self.InHearCD = false
end

function Component:BroadCastRescueAlertInfo()
  local Owner = self.Owner
  if not self.CanBroadCastAlert or not IsValid(Owner) then
    return
  end
  local CommonAlertSetValue = self.AlertData.CommonAlertSetValue or 40
  local RescueAlarmTarget = self.AlertGameMode:TriggerDungeonComponentFun("RequestRescueAlarmTargetInfo", Owner)
  DebugPrint("\230\149\145\230\143\180\229\133\184\231\139\177\233\149\191\230\138\165\232\173\166\228\189\141\229\141\179\229\176\134\232\191\155\232\161\140\229\185\191\230\146\173", Owner.Eid, Owner:GetName())
  local BroadCastInfo = FBroadCastInfo()
  BroadCastInfo.CommonAlertSetValue = CommonAlertSetValue
  BroadCastInfo.CommonAlarmTarget = RescueAlarmTarget
  for _, Monster in pairs(UE4.UGameplayStatics.GetGameState(Owner).MonsterMap) do
    if self:CheckMonsterCanBeBroadCast(Monster) then
      DebugPrint("\230\149\145\230\143\180RescueAlertInfo\232\191\155\232\161\140\228\186\134\229\185\191\230\146\173 SourceEid:" .. Owner.Eid .. " TargetEid:" .. Monster.Eid .. " TargetUnitId:" .. Monster.UnitId .. "  \229\144\140\230\173\165\228\186\134\233\128\154\231\148\168\230\138\165\232\173\166\231\154\132\232\173\166\230\136\146\229\128\188\229\146\140AlarmTarget")
      self:BroadCastChangeMonsterInfo(Owner, Monster, BroadCastInfo)
    end
  end
end

function Component:HasEnemyInClan()
  if not self:IsClanMonster() then
    return false
  end
  local Owner = self.Owner
  local ClanMgr = self.AlertGameMode:GetClan(Owner.ClanId)
  local ClanRange = 2000
  local ClanRangeRadius, ClanRangeVector
  local LeaveCollision = ClanMgr.leavecollision
  if LeaveCollision then
    if LeaveCollision.GetScaledBoxExtent then
      ClanRangeVector = LeaveCollision:GetScaledBoxExtent()
    end
    if LeaveCollision.GetScaledSphereRadius then
      ClanRangeRadius = LeaveCollision:GetScaledSphereRadius()
    end
  end
  local GameMode = UE.UGameplayStatics.GetGameMode(Owner)
  if not GameMode then
    return false
  end
  local EnemyActors = GameMode:GetAICampResult(UE.ECamp.Enemy, Owner)
  if not EnemyActors or 0 == EnemyActors:Length() then
    return false
  end
  local OwnerLocation = LeaveCollision:K2_GetComponentLocation()
  for _, EnemyActor in pairs(EnemyActors) do
    local EnemyLocation = EnemyActor:K2_GetActorLocation()
    if ClanRangeVector then
      local RelativeLocation = EnemyLocation - OwnerLocation
      local IsInRange = math.abs(RelativeLocation.X) <= ClanRangeVector.X and math.abs(RelativeLocation.Y) <= ClanRangeVector.Y and math.abs(RelativeLocation.Z) <= ClanRangeVector.Z
      if IsInRange then
        return true
      end
    elseif ClanRangeRadius then
      local Distance = UE.UKismetMathLibrary.Vector_Distance(OwnerLocation, EnemyLocation)
      if ClanRangeRadius >= Distance then
        return true
      end
    end
  end
  ClanMgr.InCommonAlert = false
  return false
end

return Component
