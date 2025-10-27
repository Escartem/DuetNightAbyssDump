require("UnLua")
require("Const")
local Component = {}

function Component:ComponentReceiveBeginPlay()
end

function Component:InitComponent()
  self.AlertingEid = 0
end

function Component:TickComponent(DeltaSeconds)
  if self.RemainTriggerAlertCD > 0 then
    self.RemainTriggerAlertCD = math.max(0, self.RemainTriggerAlertCD - DeltaSeconds)
  end
end

function Component:RequestCommonAlertingEid(Monster)
  if not IsValid(Monster) then
    return false
  end
  if self:IsInDungeon() then
    return self:DungeonRequestCommonAlertingEid(Monster)
  end
  if self:IsInRegion() then
    return self:RegionRequestCommonAlertingEid(Monster)
  end
end

function Component:DungeonRequestCommonAlertingEid(Monster)
  if 0 ~= self.AlertingEid then
    return false
  end
  if self:DungeonCheckCanEnterAlert() then
    self.AlertingEid = Monster.Eid
    self.CommonAlarmTarget = Battle(self):GetEntity(Monster.TargetAlerted[1])
    return true
  end
  return false
end

function Component:RegionRequestCommonAlertingEid(Monster)
  if self:RegionCheckCanEnterAlert(Monster) then
    local ClanMgr = self:GetClan(Monster.ClanId)
    ClanMgr.AlertingEid = Monster.Eid
    ClanMgr.CommonAlarmTarget = Battle(self):GetEntity(Monster.TargetAlerted[1])
    return true
  end
  return false
end

function Component:RegionCheckCanEnterAlert(Monster)
  if not Monster.ClanId or 0 == Monster.ClanId then
    return false
  end
  local ClanMgr = self:GetClan(Monster.ClanId)
  if not ClanMgr then
    return false
  end
  if 0 ~= ClanMgr.AlertingEid then
    return false
  end
  if ClanMgr.InCommonAlert then
    return false
  end
  if ClanMgr.RemainTriggerAlertCD > 0 then
    return false
  end
  return true
end

function Component:CheckIsInCommonAlert(ClanId)
  if self:IsInDungeon() then
    return self:DungeonCheckIsInCommonAlert()
  end
  if self:IsInRegion() then
    return self:RegionCheckIsInCommonAlert(ClanId)
  end
  return false
end

function Component:RegionCheckIsInCommonAlert(ClanId)
  local ClanMgr = self:GetClan(ClanId)
  if not ClanMgr then
    return false
  end
  return ClanMgr.InCommonAlert
end

function Component:RegionCheckCanExitAlert(ClanId)
  return self:RegionCheckIsInCommonAlert(ClanId)
end

function Component:RequestCommonAlarmTargetInfo(Monster)
  if self:IsInDungeon() then
    if self.CommonAlarmTarget ~= nil then
      return self.CommonAlarmTarget
    end
    local MinDistance, ResPlayer
    for _, Player in pairs(self:GetAllPlayer()) do
      local PlayerDistance = UE4.UKismetMathLibrary.Vector_Distance(Player:K2_GetActorLocation(), Monster:K2_GetActorLocation())
      if nil == MinDistance or MinDistance > PlayerDistance then
        MinDistance, ResPlayer = PlayerDistance, Player
      end
    end
    return ResPlayer
  end
  if self:IsInRegion() then
    if not Monster.ClanId or 0 == Monster.ClanId then
      return nil
    end
    local ClanMgr = self:GetClan(Monster.ClanId)
    if not ClanMgr then
      return nil
    end
    return ClanMgr.CommonAlarmTarget
  end
  return nil
end

function Component:GetAlertMechanismInfo(Monster)
  if self:IsInDungeon() then
    return self:DungeonGetAlertMechanismInfo(Monster)
  end
  if self:IsInRegion() then
    return self:RegionGetAlertMechanismInfo(Monster)
  end
  return nil
end

function Component:DungeonGetAlertMechanismInfo(Monster)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState.MechanismMap:FindRef("AlertMiniGame") then
    return nil
  end
  local AlertMiniGameArray = GameState.MechanismMap:FindRef("AlertMiniGame").Array
  local Res
  local MinDis = 99999
  local MonsterLoc = Monster:K2_GetActorLocation()
  for i, MiniGame in pairs(AlertMiniGameArray) do
    if IsValid(MiniGame) then
      local Dis = (MiniGame:GetMonsterAnimTrans().Translation - MonsterLoc):Size()
      if MinDis > Dis then
        MinDis = Dis
        Res = MiniGame
      end
    end
  end
  return Res
end

function Component:RegionGetAlertMechanismInfo(Monster)
  local Clan = self:GetClan(Monster.ClanId)
  if not Clan then
    return nil
  end
  return Clan:GetAlertMechanism(Monster)
end

function Component:GetClan(ClanManagerId)
  return self.EMGameState.ClanManagerMap:Find(ClanManagerId)
end

return Component
