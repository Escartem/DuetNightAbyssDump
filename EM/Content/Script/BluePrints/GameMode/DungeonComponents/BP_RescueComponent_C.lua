require("UnLua")
local BattleUtils = require("Utils.BattleUtils")
local BP_RescueComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_RescueComponent_C:InitRescueComponent()
  self.GameMode = self:GetOwner()
  self.HostageStaticId = 0
  self:SetHostageEid(0)
  self.RescueIsInCommonAlert = false
  self.RescueAlarmTarget = nil
  self.IsHostageRescued = false
  self.IsRescueCountDownTriggered = false
end

function BP_RescueComponent_C:GetHostageEid()
  return self.HostageEid
end

function BP_RescueComponent_C:SetHostageEid(Eid)
  self.HostageEid = Eid
end

function BP_RescueComponent_C:InitRescueBaseInfo()
  local StaticIds = {}
  for i = 1010000001, 1010000008 do
    if self.GameMode.EMGameState:GetStaticCreatorInfo(i) then
      table.insert(StaticIds, i)
    end
  end
  if #StaticIds < 1 then
    GameState(self):ShowDungeonError("RescueComponent:\230\149\145\230\143\180\231\142\169\230\179\149\229\134\133\230\156\170\230\137\190\229\136\176\228\186\186\232\180\168\229\136\183\230\150\176\231\130\185,\232\175\183\230\163\128\230\159\165\232\147\157\229\155\190\233\133\141\231\189\174\239\188\140\229\189\147\229\137\141\229\137\175\230\156\172Id: " .. self.GameMode.DungeonId .. ", \229\189\147\229\137\141Json: " .. UE4.URuntimeCommonFunctionLibrary.GetLevelLoadJsonName(self.GameMode))
    return
  end
  local Index = math.random(1, #StaticIds)
  self.HostageStaticId = StaticIds[Index]
  DebugPrint("RescueComponent: \230\149\145\230\143\180\231\142\169\230\179\149 \229\189\147\229\137\141\228\186\186\232\180\168\233\157\153\230\128\129\231\130\185\228\184\186\239\188\154 ", self.HostageStaticId)
end

function BP_RescueComponent_C:TriggerSpawnHostage(Player)
  self:StopRescueCountDown()
  self:RemoveHostageDoorIndicator()
  local Creator = self.GameMode.EMGameState:GetStaticCreatorInfo(self.HostageStaticId)
  local HostageExtraInfo = BattleUtils.GetExtraCreateInfo(Creator.UnitType, Creator.UnitId, Creator.UnitId)
  if Player then
    HostageExtraInfo.PhantomOwnerEid = Player.Eid
  end
  HostageExtraInfo.EventName = "RescueHostage"
  Creator:RealActiveStaticCreator(HostageExtraInfo)
  DebugPrint("RescueComponent: \230\149\145\230\143\180\231\142\169\230\179\149 TriggerSpawnHostage")
end

function BP_RescueComponent_C:OnStaticCreatorEvent(EventName, Eid, UnitId, UnitType)
  if "RescueHostage" == EventName then
    self:SetHostageEid(Eid)
    DebugPrint("RescueComponent: \230\149\145\230\143\180\231\142\169\230\179\149 \231\148\159\230\136\144\228\186\186\232\180\168\239\188\140\229\189\147\229\137\141\228\186\186\232\180\168Eid\228\184\186\239\188\154 ", self:GetHostageEid())
    local Hostage = Battle(self):Getentity(self:GetHostageEid())
    if IsValid(Hostage) then
      Hostage:StopBT("RescueDoor")
      Hostage:ActiveHostageGuide("Add", Eid)
      self.GameMode:TriggerGameModeEvent("OnSpawnHostage")
      self.GameMode:TriggerDungeonAchieve("OnHostageRescued", -1)
      if self.GameMode:GetNeedCreateEmergencyMonster("Pet") then
        self.GameMode:TriggerSpawnPet()
      end
      GameState(self):SyncHostageState(Hostage)
      self.IsHostageRescued = true
    end
  end
end

function BP_RescueComponent_C:TriggerStartHostageBT()
  local Hostage = Battle(self):Getentity(self:GetHostageEid())
  if IsValid(Hostage) then
    Hostage:RestartBT()
    DebugPrint("RescueComponent: \229\188\128\229\144\175\228\186\186\232\180\168\232\161\140\228\184\186\230\160\145\239\188\140Eid:", self:GetHostageEid())
  end
end

function BP_RescueComponent_C:TriggerRescueExitMechanismOverlap(Player)
  DebugPrint("RescueComponent: \230\149\145\230\143\180\231\142\169\230\179\149\230\156\137\231\142\169\229\174\182\229\136\176\232\190\190\230\146\164\231\166\187\231\130\185, Player Eid =", Player.Eid)
  local Hostage = Battle(self):Getentity(self:GetHostageEid())
  if nil == Hostage then
    DebugPrint("RescueComponent Error: \228\186\186\232\180\168\230\156\170\229\136\183\229\135\186\239\188\140\230\151\160\230\179\149\231\167\187\229\138\168\229\136\176\230\146\164\231\166\187\230\156\186\229\133\179")
  end
  local ExitMachanism = self.GameMode:GetEscapeMechanismActor()
  if nil == ExitMachanism then
    DebugPrint("RescueComponent Error: \230\146\164\231\166\187\230\156\186\229\133\179\228\184\141\229\173\152\229\156\168\239\188\140\228\186\186\232\180\168\231\167\187\229\138\168\230\151\160\231\155\174\230\160\135")
  end
  UE4.UNavigationFunctionLibrary.ActorToActorTeleport(Hostage, ExitMachanism)
  Hostage:StopBT("RescueHostageSucceed")
end

function BP_RescueComponent_C:TriggerRescuePlayerDungeonEnd(Player)
  if self.GameMode.EMGameState:CheckGameModeStateNotEnd() then
    Player:ChangeHostageOwner()
  end
end

function BP_RescueComponent_C:TriggerRescueOnEnd()
  local Hostage = Battle(self):Getentity(self:GetHostageEid())
  if Hostage then
    Hostage:EMActorDestroy(EDestroyReason.HostageRescueEnd)
  end
end

function BP_RescueComponent_C:AddHostageDoorIndicator()
  if not self.RescueGuideShowEnable then
    self.RescueGuideShowEnable = true
    local IgnoreList = TArray(0)
    IgnoreList:Add(self.HostageDoor.Eid)
    self.HostageDoor:DeactiveAllGuide(IgnoreList)
  end
end

function BP_RescueComponent_C:RemoveHostageDoorIndicator()
  if self.RescueGuideShowEnable then
    self.RescueGuideShowEnable = false
  end
end

function BP_RescueComponent_C:TriggerRescueTimerLowEvent()
  if not self.RescueLowTimeTriggered then
    self.RescueLowTimeTriggered = true
    self.GameMode:TriggerGameModeEvent("OnRescueCountDownLow")
  end
end

function BP_RescueComponent_C:OnHostageDie(Hostage)
  if Hostage.Eid == self:GetHostageEid() then
    DebugPrint("RescueComponent: \228\186\186\232\180\168\230\173\187\228\186\161\239\188\129")
    self.GameMode:TriggerGameModeEvent("OnHostageDieBP")
    self.GameMode:TriggerDungeonFailed()
  end
end

function BP_RescueComponent_C:OnHostageDying(Hostage)
  if Hostage.Eid == self:GetHostageEid() then
    DebugPrint("RescueComponent: \228\186\186\232\180\168\229\128\146\229\156\176\239\188\129")
    self.GameMode:TriggerGameModeEvent("OnHostageDyingBP")
    local NowTime = URuntimeCommonFunctionLibrary.GetNowTimeStamp()
    self.GameMode:AddDungeonEvent("HostageDyingCountDown")
  end
end

function BP_RescueComponent_C:SetRescueHostageDoor(Door)
  self.HostageDoor = Door
end

function BP_RescueComponent_C:StartRescueCountDown()
  if self.IsRescueCountDownTriggered then
    DebugPrint("RescueComponent: \229\128\146\232\174\161\230\151\182\229\183\178\232\167\166\229\143\145\239\188\140\228\184\141\233\135\141\229\164\141\230\183\187\229\138\160")
    return
  end
  if self.IsHostageRescued then
    DebugPrint("RescueComponent: \228\186\186\232\180\168\229\183\178\232\167\163\230\149\145\239\188\140\228\184\141\232\167\166\229\143\145\229\128\146\232\174\161\230\151\182")
    return
  end
  local DungenData = DataMgr.Rescue[self.GameMode.DungeonId]
  if nil == DungenData then
    DebugPrint("RescueComponent Error: \229\137\175\230\156\172\232\161\168\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, DungeonId =", self.GameMode.DungeonId)
  end
  self.GameMode.EMGameState:SetRescueCountDownTime(DungenData.HostageRescueTime or 0)
  self.RescueLowTimeThreshold = DungenData.RescueLowTimeThreshold or 0
  self.RescueLowTimeTriggered = false
  self.IsRescueCountDownTriggered = true
  self:AddTimer(1, self.RescueCountDown, true, 0, "RescueCountDownTimer")
  self.GameMode:AddDungeonEvent("RescueCountDownUI")
  self.GameMode:TriggerGameModeEvent("OnRescueCountDownStart")
  DebugPrint("RescueComponent: \229\164\132\229\134\179\229\128\146\232\174\161\230\151\182\229\188\128\229\167\139\239\188\129\230\151\182\233\151\180", DungenData.HostageRescueTime)
end

function BP_RescueComponent_C:RescueCountDown()
  self:AddToRescueCountDownTime(-1)
  DebugPrint("RescueComponent: RescueCountDownTime =", self:GetRescueCountDownTime())
  if self:GetRescueCountDownTime() <= self.RescueLowTimeThreshold then
    self:TriggerRescueTimerLowEvent()
    self:AddHostageDoorIndicator()
  end
  if self:GetRescueCountDownTime() <= 0 then
    self:RemoveHostageDoorIndicator()
    self:StopRescueCountDown()
    self.GameMode:TriggerGameModeEvent("OnHostageDieBP")
    self.GameMode:TriggerDungeonFailed()
  end
end

function BP_RescueComponent_C:StopRescueCountDown()
  if not self.IsRescueCountDownTriggered then
    return
  end
  self:RemoveTimer("RescueCountDownTimer")
  self.GameMode:RemoveDungeonEvent("RescueCountDownUI")
  DebugPrint("RescueComponent: \229\164\132\229\134\179\229\128\146\232\174\161\230\151\182\229\133\179\233\151\173\239\188\129")
end

function BP_RescueComponent_C:AddToRescueCountDownTime(Value)
  self.GameMode.EMGameState:SetRescueCountDownTime(math.max(0, self.GameMode.EMGameState.RescueCountDownTime + Value))
  if IsStandAlone(self) then
    self.GameMode.EMGameState:OnRep_RescueCountDownTime()
  end
end

function BP_RescueComponent_C:GetRescueCountDownTime()
  return self.GameMode.EMGameState.RescueCountDownTime
end

function BP_RescueComponent_C:TriggerRescueAlert(Monster)
  self:StartRescueCountDown()
  if Monster.MonAlertComponent then
    Monster.MonAlertComponent:AlertStateChange(Const.FightState, true)
    Monster.MonAlertComponent:RequestRescueAlertSuccess()
  end
  DebugPrint("RescueComponent: \230\149\145\230\143\180\231\142\169\230\179\149\232\167\166\229\143\145\231\155\145\231\139\177\233\149\191\232\173\166\230\136\146, RescueCountDownTime =", self:GetRescueCountDownTime())
end

function BP_RescueComponent_C:TrySetRescueAlertingInfo(LastTargetAlertedNum, Monster)
  if not IsValid(Monster) then
    return false
  end
  if 0 ~= self.GameMode:GetRescueAlertingEid() then
    return false
  end
  if not Monster:IsJailerMonster() then
    return false
  end
  if self.RescueIsInCommonAlert then
    return false
  end
  if self.IsRescueCountDownTriggered then
    return false
  end
  if Monster.TargetAlerted:Num() > 0 then
    self.GameMode:SetRescueAlertingEid(Monster.Eid)
    self.RescueAlarmTarget = Battle(self):GetEntity(Monster.TargetAlerted[1])
    local MonAlertComponent = Monster.MonAlertComponent
    if MonAlertComponent then
      MonAlertComponent:SetAlertValue(math.floor(MonAlertComponent.MaxAlertValue - 1), false)
    end
    Monster:BBSetAlarmTarget(self.RescueAlarmTarget)
    Monster:GetOwnBlackBoardComponent():SetValueAsBool("AlarmTrigger", true)
    DebugPrint("RescueComponent: \230\149\145\230\143\180\231\142\169\230\179\149\229\133\184\231\139\177\233\149\191\230\138\162\229\141\160\230\138\165\232\173\166\228\189\141\230\136\144\229\138\159\239\188\140\229\188\128\229\167\139\230\138\165\232\173\166\229\138\168\231\148\187---Eid:" .. Monster.Eid .. " UnitId:" .. Monster.UnitId .. " Loc:" .. tostring(Monster:K2_GetActorLocation()) .. " AlarmTargetLoc:" .. tostring(self.RescueAlarmTarget:K2_GetActorLocation()))
    return true
  end
  return false
end

function BP_RescueComponent_C:IsRescueAlertingMonster(Monster)
  if not Monster:IsJailerMonster() then
    return false
  end
  return Monster.Eid == self.GameMode:GetRescueAlertingEid()
end

function BP_RescueComponent_C:TryResetRescueAlertingInfo(Monster)
  if Monster.Eid == self.GameMode:GetRescueAlertingEid() then
    DebugPrint("RescueComponent: \230\149\145\230\143\180\231\142\169\230\179\149\229\133\184\231\139\177\233\149\191\233\135\141\231\189\174\230\138\165\232\173\166\228\189\141\230\136\144\229\138\159", Monster.Eid)
    self.GameMode:SetRescueAlertingEid(0)
    Monster:GetOwnBlackBoardComponent():SetValueAsBool("AlarmTrigger", false)
  end
end

function BP_RescueComponent_C:RequestRescueAlarmTargetInfo(Monster)
  if self.RescueAlarmTarget ~= nil then
    return self.RescueAlarmTarget
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

return BP_RescueComponent_C
